import 'package:auth_marketplace/core/base/base_state.dart';
import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/domain/usecases/forget_password_usecase.dart';
import 'package:auth_marketplace/core/utils/hive_manager.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';
import 'package:auth_marketplace/features/login/data/models/login_model.dart';

import 'package:auth_marketplace/features/login/domain/usecases/auth_state_changes_usecase.dart';
import 'package:auth_marketplace/features/login/domain/usecases/sign_in_with_email_and_password_usecase.dart';


import 'package:auth_marketplace/features/login/domain/usecases/sign_out_usecase.dart';
import 'package:auth_marketplace/features/login/login_dependency_injection.dart';

import '../../domain/usecases/auth_state_changes_usecase.dart';

class LoginCubit extends Cubit<BaseState> {
  final HiveManager? _hiveManager;
  bool passwordHide = true;

  LoginCubit(HiveManager? hiveManager)
      : _hiveManager = hiveManager,
        super(StateInitial());

  final AuthStateChangesUseCase authStateChangesUseCase =
      slLogin<AuthStateChangesUseCase>();
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase =
      slLogin<SignInWithEmailAndPasswordUseCase>();
  final ForgetPasswordUseCase forgetPasswordUseCase =
      slLogin<ForgetPasswordUseCase>();
  final SignOutUseCase signOutUseCase = slLogin<SignOutUseCase>();

  ///This method will check logged in user Auth Session.
  ///
  ///Will emit the [StateOnSuccess] with possible navigation route.
  ///Will emit the [StateErrorGeneral] with failure error message.
  Future<void> checkUserAuthSession() async {
    authStateChangesUseCase.call(NoParams()).listen((authStatus) {
      authStatus.fold((failure) {
        emit(StateErrorGeneral(
            failure.message ?? failure.errorCode.name, failure.errorCode));
      }, (userData) {
        emit(StateOnSuccess(userData));
      });
    });
  }

  ///This method is performing email and password login into the app.
  Future<void> performEmailAndPasswordSignIn(
      {required String email, required String password}) async {
    emit(StateLoading());
    signInWithEmailAndPasswordUseCase
        .call(LoginModel(email: email, password: password))
        .listen((authStatus) {
      authStatus.fold((failure) {
        emit(StateErrorGeneral(
            failure.message ?? failure.errorCode.name, failure.errorCode));
      }, (userData) {
        UserModel user = UserModel(
            uid: userData?.uid ?? "",
            displayName: userData?.displayName ?? "",
            emailVerified: userData?.emailVerified ?? false,
            phoneNumber: userData?.phoneNumber ?? "",
            photoURL: userData?.photoURL ?? "",
            email: userData?.email ?? "");
        _hiveManager?.setValueForKey(user, HiveKeys.userDetail);
        emit(StateOnSuccess(userData));
      });
    });
  }

  ///This method is responsible for performing sign out .
  void performSignOut() {
    emit(StateLoading());
    signOutUseCase.call(NoParams()).listen((userSignOutResponse) {
      userSignOutResponse.fold((failure) {
        emit(StateErrorGeneral(
            failure.message ?? failure.errorCode.name, failure.errorCode));
      }, (status) {
        _hiveManager?.deleteValueForKey(HiveKeys.userDetail);
        emit(StateOnSuccess(status));
      });
    });
  }

  performForgetPassword({required String email}) async {
    var data =
        await forgetPasswordUseCase.call(ForgetPasswordParam(email: email));
    data.listen((event) {
      event.fold((l) => null, (r) => null);
    });
  }

  setPasswordVisibility() {
    passwordHide = !passwordHide;
    emit(StateOnSuccess(passwordHide));
  }
}
