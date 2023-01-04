import '../../data/models/onboard_model.dart';
import '../repositories/onboard_repository.dart';
import '../../../../core/core.dart';
import 'package:dartz/dartz.dart';

class OnBoardUseCase implements UseCase<OnBoardModel, NoParams> {
  final OnBoardRepository onBoardRepository;

  OnBoardUseCase({required this.onBoardRepository});

  @override
  Stream<Either<Failure, OnBoardModel>> call(NoParams noParams) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
