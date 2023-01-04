import 'package:auth_marketplace/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import 'package:auth_marketplace/features/login/data/models/login_model.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';
import 'login_data_sources.dart';

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
      LoginModel loginModel) async {
    //ToDo: Add your login api call here.
    return Right(UserModel());
  }

  @override
  Stream<Either<Failure, bool>> authStateChanges() {
    //ToDo: Add your auth state change api call here.
    return Stream.value(Right(false));
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      //Todo : Add your SignOut api call here.
      return Right(false);
    } catch (error) {
      return Left(parseExceptionBasedOnStatusCode(error));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String emailAddress) async {
    //ToDo: Add your forgot password api call here.
    return Right(emailAddress);
  }
}
