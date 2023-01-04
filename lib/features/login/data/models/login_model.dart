import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password,
  });

  LoginModel.fromJson(
    Map<String, dynamic> json,
  ) {
    email = json['email'] ?? "";
    password = json['password'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [];
}
