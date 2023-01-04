import 'package:get_it/get_it.dart';
import 'package:auth_marketplace/features/onboard/data/datasources/onboard_data_source.dart';
import 'package:auth_marketplace/features/onboard/data/datasources/onboard_data_source_impl.dart';
import 'package:auth_marketplace/features/onboard/data/repositories/onboard_repository_impl.dart';
import 'package:auth_marketplace/features/onboard/domain/repositories/onboard_repository.dart';
import 'package:auth_marketplace/features/onboard/domain/usecases/onboard_usecase.dart';
import 'package:auth_marketplace/features/onboard/presentation/cubit/onboard_cubit.dart';

final slOnboard = GetIt.instance;

Future<void> onboardInit() async {
  //cubit
  slOnboard.registerFactory<OnBoardCubit>(
      () => OnBoardCubit(onBoardUseCase: slOnboard.call()));

  // useCases

  slOnboard.registerLazySingleton<OnBoardUseCase>(
      () => OnBoardUseCase(onBoardRepository: slOnboard.call()));

  // repository

  slOnboard.registerLazySingleton<OnBoardRepository>(
      () => OnBoardRepositoryImpl(onBoardDataSource: slOnboard.call()));

  // datasource

  slOnboard
      .registerLazySingleton<OnBoardDataSource>(() => OnBoardDataSourceImpl());
}
