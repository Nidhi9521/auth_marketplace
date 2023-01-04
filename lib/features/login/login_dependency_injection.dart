import 'package:get_it/get_it.dart';
import 'package:auth_marketplace/core/utils/hive_manager.dart';

import 'data/datasources/login_data_sources.dart';
import 'data/datasources/login_data_sources_impl.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/auth_state_changes_usecase.dart';

import 'domain/usecases/sign_in_with_email_and_password_usecase.dart';

import 'domain/usecases/sign_out_usecase.dart';
import 'presentation/cubit/login_cubit.dart';

import 'package:auth_marketplace/features/login/domain/usecases/forget_password_usecase.dart';

final slLogin = GetIt.instance;

Future<void> loginInit() async {
//data sources
  slLogin.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());

//repositories
  slLogin.registerLazySingleton<LoginRepository>(() => LoginRepositoriesImpl(
        loginDataSource: slLogin(),
      ));

//use cases

  slLogin.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(loginRepository: slLogin()));

  slLogin.registerLazySingleton<AuthStateChangesUseCase>(
      () => AuthStateChangesUseCase(loginRepository: slLogin()));

  slLogin.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
      () => SignInWithEmailAndPasswordUseCase(loginRepository: slLogin()));

  slLogin.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(loginRepository: slLogin()));

  //cubit
  slLogin.registerFactory<LoginCubit>(() => LoginCubit(hiveBox));
}
