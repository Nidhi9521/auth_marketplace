class SignUpModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  final String? countryCode;

  const SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.countryCode});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "countryCode": countryCode,
    };
  }
}
