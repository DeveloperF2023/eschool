import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? profilePicture;
  final String? createdAt;
  final String? updatedAt;
  final String? loginCode;

  const UserDataEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.profilePicture,
      this.createdAt,
      this.updatedAt,
      this.loginCode});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        role,
        profilePicture,
        createdAt,
        updatedAt,
        loginCode
      ];
}
