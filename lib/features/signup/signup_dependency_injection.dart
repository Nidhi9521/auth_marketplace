import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/signup_data_source.dart';
import 'data/datasources/signup_data_source_impl.dart';
import 'data/repositories/signup_repository_impl.dart';
import 'domain/repositories/signup_repository.dart';
import 'domain/usecases/signup_usecase.dart';

import 'presentation/cubit/signup_cubit.dart';

GetIt slSignUp = GetIt.instance;

Future<void> signUpInit() async {
  //cubit
  slSignUp.registerFactory(() => SignUpCubit(signUpUsecase: slSignUp()));

  // Usecase
  slSignUp
      .registerLazySingleton(() => SignUpUsecase(signUpRepository: slSignUp()));

  // Dio
  slSignUp.registerLazySingleton(() => Dio());

  // Repository
  slSignUp.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: slSignUp()));

  // DataSource
  slSignUp.registerLazySingleton<SignUpDataSource>(
      () => SignUpDataSourceImpl(dio: slSignUp()));
}
