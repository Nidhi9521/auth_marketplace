import 'package:dartz/dartz.dart';
import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/domain/repositories/login_repository.dart';

class SignOutUseCase implements UseCase<bool, NoParams> {
  final LoginRepository loginRepository;

  SignOutUseCase({required this.loginRepository});

  @override
  Stream<Either<Failure, bool>> call(NoParams params) {
    return loginRepository.signOut();
  }
}
