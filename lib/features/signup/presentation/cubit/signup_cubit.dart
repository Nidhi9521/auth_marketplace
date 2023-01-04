import 'package:bloc/bloc.dart';
import 'package:auth_marketplace/core/base/base_state.dart';
import 'package:auth_marketplace/features/signup/presentation/cubit/signup_state.dart';
import '../../data/model/signup_model.dart';
import '../../domain/usecases/signup_usecase.dart';

class SignUpCubit extends Cubit<BaseState> {
  SignUpUsecase signUpUsecase;
  bool passwordHide = true;
  bool confirmPasswordHide = true;

  SignUpCubit({required this.signUpUsecase}) : super(StateInitial());

  selectCountry(value) {
    emit(StateSearchResult(value));
  }

  signUpData(firstName, lastName, email, phoneNumber, password, countryCode) {
    final res = signUpUsecase.call(SignUpModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      countryCode: countryCode,
    ));
    res.listen((event) {
      event.fold(
          (failure) => emit(StateErrorGeneral(
              failure.message ?? failure.errorCode.name, failure.errorCode)),
          (SignUpModel) => emit(StateOnSuccess(res)));
    });
  }

  setPasswordVisibility() {
    passwordHide = !passwordHide;
    if (state is PasswordVisibilityState) {
      var success = state as PasswordVisibilityState;
      emit(success.copyWith(
          hidePassword: passwordHide, update: !success.update));
    } else {
      emit(PasswordVisibilityState(hidePassword: passwordHide));
    }
  }

  setConfirmPasswordVisibility() {
    confirmPasswordHide = !confirmPasswordHide;
    if (state is PasswordVisibilityState) {
      var success = state as PasswordVisibilityState;
      emit(success.copyWith(
          hideConfirmPassword: confirmPasswordHide, update: !success.update));
    } else {
      emit(PasswordVisibilityState(hideConfirmPassword: confirmPasswordHide));
    }
  }
}
