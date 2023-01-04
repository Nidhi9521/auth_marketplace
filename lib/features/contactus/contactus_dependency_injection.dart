import 'package:get_it/get_it.dart';
import 'package:auth_marketplace/features/contactus/data/datasources/contactus_data_source.dart';
import 'package:auth_marketplace/features/contactus/data/datasources/contactus_data_source_impl.dart';
import 'package:auth_marketplace/features/contactus/data/repositories/contactus_repository_impl.dart';
import 'package:auth_marketplace/features/contactus/domain/repositories/contactus_repository.dart';
import 'package:auth_marketplace/features/contactus/domain/usecases/contactus_usecase.dart';
import 'package:auth_marketplace/features/contactus/presentation/cubit/contactus_cubit.dart';

final slContactus = GetIt.instance;

Future<void> contactusInit() async {
  //cubit
  slContactus.registerFactory<ContactUsCubit>(
      () => ContactUsCubit(contactUsUseCase: slContactus.call()));

  // useCases

  slContactus.registerLazySingleton<ContactUsUseCase>(
      () => ContactUsUseCase(contactUsRepository: slContactus.call()));

  // repository

  slContactus.registerLazySingleton<ContactUsRepository>(
      () => ContactUsRepositoryImpl(contactUsDataSource: slContactus.call()));

  // datasource

  slContactus.registerLazySingleton<ContactUsDataSource>(
      () => ContactUsDataSourceImpl());
}
