import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../model/signup_model.dart';

abstract class SignUpDataSource {
  Stream<Either<Failure, void>> signUp(SignUpModel signUpModel);
}
