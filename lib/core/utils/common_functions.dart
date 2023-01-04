import 'dart:io';
import '../core.dart';

import 'package:flutter/services.dart';

Failure parseExceptionBasedOnStatusCode(Object exception) {
  if (exception is SocketException) {
    return SocketFailure(message: exception.message, exception: Exception);
  } else if (exception is PlatformException) {
    {
      return PlatformFailure(
          exception: Exception, message: exception.message ?? exception.code);
    }
  } else if (exception is DioError) {
    if (exception.response != null) {
      var statusCode = exception.response?.statusCode ?? 0;
      if (statusCode == 403) {
        return ServerFailure(
            errorCode: APIErrorCode.unauthorized,
            exception: exception.response);
      } else if (statusCode == 400) {
        return ServerFailure(
            errorCode: APIErrorCode.badRequest,
            exception: exception.response?.data);
      } else if (statusCode == 401) {
        return ServerFailure(
            errorCode: APIErrorCode.forbidden, exception: exception.response);
      } else if (statusCode == 404) {
        return ServerFailure(
            errorCode: APIErrorCode.dataNotFound,
            exception: exception.response);
      } else if (statusCode >= 500 || statusCode >= 599) {
        return ServerFailure(
            errorCode: APIErrorCode.servererror, exception: exception.response);
      } else {
        return ServerFailure(
            errorCode: APIErrorCode.unknownError,
            exception: exception.response);
      }
    } else if (exception.type == APIErrorCode.connectTimeout) {
      return ServerFailure(
          errorCode: APIErrorCode.connectTimeout, exception: exception);
    } else {
      throw ServerFailure(
          errorCode: APIErrorCode.servererror, exception: exception);
    }
  } else {
    return UnknownFailure(exception: Exception);
  }
}
