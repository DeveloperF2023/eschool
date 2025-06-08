import 'package:eschool_management/features/domain/entities/user/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? profilePicture;
  String? createdAt;
  String? updatedAt;
  String? loginCode;

  UserDataModel(
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

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loginCode = json['login_code'];
  }
}
