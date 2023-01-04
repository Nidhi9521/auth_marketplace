import 'package:get_it/get_it.dart';
import 'package:auth_marketplace/features/about/data/datasources/about_data_source.dart';
import 'package:auth_marketplace/features/about/data/datasources/about_data_source_impl.dart';
import 'package:auth_marketplace/features/about/data/repositories/about_repository_impl.dart';
import 'package:auth_marketplace/features/about/domain/repositories/about_repository.dart';
import 'package:auth_marketplace/features/about/domain/usecases/about_usecase.dart';
import 'package:auth_marketplace/features/about/presentation/cubit/about_cubit.dart';

final slAbout = GetIt.instance;

Future<void> aboutInit() async {
  //cubit
  slAbout.registerFactory<AboutCubit>(
      () => AboutCubit(aboutUseCase: slAbout.call()));

  // useCases

  slAbout.registerLazySingleton<AboutUseCase>(
      () => AboutUseCase(aboutRepository: slAbout.call()));

  // repository

  slAbout.registerLazySingleton<AboutRepository>(
      () => AboutRepositoryImpl(aboutDataSource: slAbout.call()));

  // datasource

  slAbout.registerLazySingleton<AboutDataSource>(() => AboutDataSourceImpl());
}
