import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/model/signup_model.dart';

abstract class SignUpRepository {
  Stream<Either<Failure, void>> signUpData(SignUpModel signUpModel);
}
