import 'package:dartz/dartz.dart';

import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/core/utils/failure.dart';
import 'package:auth_marketplace/features/login/data/models/login_model.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';

abstract class LoginDataSource {
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
      LoginModel loginModel);

  Stream<Either<Failure, bool>> authStateChanges();

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, void>> forgetPassword(String emailAddress);
}
