import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import 'package:auth_marketplace/core/utils/failure.dart';
import 'package:auth_marketplace/features/login/domain/repositories/login_repository.dart';
import 'package:auth_marketplace/features/login/data/datasources/login_data_sources.dart';
import 'package:auth_marketplace/features/login/data/models/login_model.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';

class LoginRepositoriesImpl extends LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoriesImpl({required this.loginDataSource});

  @override
  Stream<Either<Failure, UserModel?>> signInWithEmailAndPassword(
      LoginModel loginModel) {
    return Stream.fromFuture(
            loginDataSource.signInWithEmailAndPassword(loginModel))
        .flatMap((value) {
      return value.fold((error) {
        return Stream.value(Left(error));
      }, (user) {
        return Stream.value(Right(user));
      });
    });
  }

  @override
  Stream<Either<Failure, bool>> authStateChanges() {
    return loginDataSource.authStateChanges();
  }

  @override
  Stream<Either<Failure, bool>> signOut() {
    return Stream.fromFuture(loginDataSource.signOut()).flatMap((value) {
      return value.fold((error) {
        return Stream.value(Left(error));
      }, (status) {
        return Stream.value(Right(status));
      });
    });
  }

  @override
  Stream<Either<Failure, void>> forgetPassword(String email) {
    return Stream.fromFuture(loginDataSource.forgetPassword(email));
  }
}
