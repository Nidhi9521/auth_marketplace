import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../data/model/signup_model.dart';
import '../repositories/signup_repository.dart';

class SignUpUsecase extends UseCase<void, SignUpModel> {
  final SignUpRepository signUpRepository;

  SignUpUsecase({required this.signUpRepository});

  @override
  Stream<Either<Failure, void>> call(SignUpModel params) {
    // TODO: implement call
    return signUpRepository.signUpData(params);
  }
}
