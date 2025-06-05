import 'package:eschool_management/features/data/models/user/user_data_model.dart';
import 'package:eschool_management/features/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  String? token;
  UserDataModel? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
  }
}
