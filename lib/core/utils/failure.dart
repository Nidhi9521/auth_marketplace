abstract class Failure {
  final String? message;
  final APIErrorCode errorCode;
  final dynamic exception;

  const Failure({required this.errorCode, this.exception, this.message = ""});

  @override
  String toString() {
    return message ?? "";
  }
}

class AuthFailure extends Failure {
  AuthFailure(
      {String message = "Something went wrong.",
      APIErrorCode errorCode = APIErrorCode.unknownError,
      dynamic exception = Exception})
      : super(errorCode: errorCode, message: message, exception: exception);
}

class SocketFailure extends Failure {
  SocketFailure({required super.exception, super.message})
      : super(errorCode: APIErrorCode.noInternetError);
}

class ServerFailure extends Failure {
  final APIErrorCode errorCode;
  ServerFailure({required this.errorCode, super.exception, super.message})
      : super(errorCode: errorCode);
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.exception, super.message})
      : super(errorCode: APIErrorCode.platformError);
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.exception})
      : super(
            errorCode: APIErrorCode.unknownError,
            message: "Unknown error message.");
}

enum APIErrorCode {
  networkRequestFailed,
  noInternetError,
  unknownError,
  tokenExpired,
  forbidden,
  unauthorized,
  servererror,
  dataNotFound,
  badRequest,
  connectionTimeout,
  invalidResponseStatus,
  responseParseException,
  wrongPassword,
  emailAlreadyInUse,
  userNotFound,
  invalidEmail,
  signInAppleError,
  platformError,
  facebookLoginCancelled,
  facebookLoginFailed,
  facebookLoginInProgress,
  googleLoginCancelled,
  connectTimeout
}
