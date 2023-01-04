import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? displayName;
  @HiveField(3)
  final bool? emailVerified;
  @HiveField(4)
  final String? phoneNumber;
  @HiveField(5)
  final String? photoURL;

  UserModel(
      {this.email = '',
      this.displayName = '',
      this.emailVerified = false,
      this.phoneNumber = '',
      this.photoURL = '',
      this.uid = ''});

  @override
  List<Object?> get props =>
      [email, displayName, emailVerified, phoneNumber, photoURL, uid];
}
