import 'package:auth_marketplace/core/base/base_state.dart';

class SignUpState extends BaseState {}

class SetValueState extends BaseState {
  String value;
  bool update;

  SetValueState(this.value, {this.update = false});

  SetValueState copyWith({
    String? value,
    bool? update,
  }) =>
      SetValueState(
        value ?? this.value,
        update: update ?? this.update,
      );
}

class PasswordVisibilityState extends BaseState {
  bool hidePassword;
  bool hideConfirmPassword;
  bool update;

  PasswordVisibilityState(
      {this.hidePassword = true,
      this.hideConfirmPassword = true,
      this.update = false});

  PasswordVisibilityState copyWith({
    bool? hidePassword,
    bool? hideConfirmPassword,
    bool? update,
  }) =>
      PasswordVisibilityState(
        hidePassword: hidePassword ?? this.hidePassword,
        hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
        update: update ?? this.update,
      );
}
