import '../../data/models/about_model.dart';
import '../repositories/about_repository.dart';
import '../../../../core/core.dart';
import 'package:dartz/dartz.dart';

class AboutUseCase implements UseCase<AboutModel, NoParams> {
  final AboutRepository aboutRepository;

  AboutUseCase({required this.aboutRepository});

  @override
  Stream<Either<Failure, AboutModel>> call(NoParams noParams) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
