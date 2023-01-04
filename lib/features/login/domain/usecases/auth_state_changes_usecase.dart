import 'package:dartz/dartz.dart';

import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/domain/repositories/login_repository.dart';

class AuthStateChangesUseCase implements UseCase<bool, NoParams> {
  final LoginRepository loginRepository;

  AuthStateChangesUseCase({required this.loginRepository});

  @override
  Stream<Either<Failure, bool>> call(NoParams noParams) {
    return loginRepository.authStateChanges();
  }
}
