import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/core.dart';
import '../model/signup_model.dart';
import 'signup_data_source.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  late Dio dio;

  SignUpDataSourceImpl({required this.dio});

  @override
  Stream<Either<Failure, void>> signUp(SignUpModel signupModel) {
    // TODO: implement signUp
    try {
      return Stream.value(Right(null));
    } catch (error) {
      return Stream.value(Left(parseExceptionBasedOnStatusCode(error)));
    }
  }
}
