import 'package:auth_marketplace/core/utils/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/base/usecase.dart';
import '../repositories/login_repository.dart';

class ForgetPasswordUseCase implements UseCase<void, ForgetPasswordParam> {
  final LoginRepository loginRepository;
  ForgetPasswordUseCase({required this.loginRepository});

  @override
  Stream<Either<Failure, void>> call(ForgetPasswordParam params) {
    return loginRepository.forgetPassword(params.email);
  }
}

class ForgetPasswordParam {
  final String email;
  const ForgetPasswordParam({required this.email});

  @override
  List<Object?> get props => [email];
}
