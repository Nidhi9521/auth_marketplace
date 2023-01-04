import '../datasources/about_data_source.dart';
import '../models/about_model.dart';
import '../../domain/repositories/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  final AboutDataSource aboutDataSource;

  AboutRepositoryImpl({required this.aboutDataSource});

  // Add method if any
}
