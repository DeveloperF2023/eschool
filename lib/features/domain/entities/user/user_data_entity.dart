import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final int? id;
  final int? classroomId;
  final String? name;
  final String? email;
  final String? role;
  final String? loginCode;
  final int? approved;
  final String? createdAt;
  final String? updatedAt;

  const UserDataEntity(
      {this.id,
      this.classroomId,
      this.name,
      this.email,
      this.role,
      this.loginCode,
      this.approved,
      this.createdAt,
      this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        classroomId,
        name,
        email,
        role,
        loginCode,
        approved,
        createdAt,
        updatedAt
      ];
}
