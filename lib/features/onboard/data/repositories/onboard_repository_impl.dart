import '../datasources/onboard_data_source.dart';
import '../../domain/repositories/onboard_repository.dart';

class OnBoardRepositoryImpl implements OnBoardRepository {
  final OnBoardDataSource onBoardDataSource;

  OnBoardRepositoryImpl({required this.onBoardDataSource});

  // Add methods here
}
