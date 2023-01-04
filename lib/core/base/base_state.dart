import 'package:equatable/equatable.dart';

import '../utils/failure.dart';

abstract class BaseState {}

class Uninitialized extends BaseState {}

class Authenticated extends BaseState {}

class Unauthenticated extends BaseState {}

class StateInitial extends BaseState implements Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => null;
}

class StateLoading extends BaseState implements Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => null;
}

class StateNoData extends BaseState {}

class StateShowSearching extends BaseState {}

class StateSearchResult<T> extends BaseState {
  T response;

  StateSearchResult(this.response);
}

class StateInternetError extends BaseState {}

class StateError400 extends BaseState {}

class StateErrorServer extends BaseState {}

class StateOnSuccess<T> extends BaseState {
  T response;
  bool update;

  StateOnSuccess(this.response, {this.update = false});

  StateOnSuccess copyWith({
    T? response,
    bool? update,
  }) =>
      StateOnSuccess(
        response ?? this.response,
        update: update ?? this.update,
      );
}

class ValidationError extends BaseState {
  String errorMessage;

  ValidationError(this.errorMessage);
}

class StateErrorGeneral extends BaseState {
  String errorMessage;
  APIErrorCode errorCode;

  StateErrorGeneral(this.errorMessage, this.errorCode);
}
