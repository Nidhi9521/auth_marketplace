import 'package:dartz/dartz.dart';

import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/data/models/login_model.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';

abstract class LoginRepository {
  Stream<Either<Failure, bool>> authStateChanges();

  Stream<Either<Failure, UserModel?>> signInWithEmailAndPassword(
      LoginModel loginModel);

  Stream<Either<Failure, bool>> signOut();

  Stream<Either<Failure, void>> forgetPassword(String email);
}
