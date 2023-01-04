import 'package:dartz/dartz.dart';

import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/data/models/login_model.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';
import 'package:auth_marketplace/features/login/domain/repositories/login_repository.dart';

class SignInWithEmailAndPasswordUseCase
    extends UseCase<UserModel?, LoginModel> {
  final LoginRepository loginRepository;

  SignInWithEmailAndPasswordUseCase({required this.loginRepository});

  @override
  Stream<Either<Failure, UserModel?>> call(LoginModel params) {
    return loginRepository.signInWithEmailAndPassword(params);
  }
}
