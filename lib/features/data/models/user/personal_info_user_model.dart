import 'package:eschool_management/features/domain/entities/user/personal_info_user_entity.dart';

class PersonalInfoUserModel extends PersonalInfoUserEntity {
  String? name;
  String? role;
  String? classroomName;
  String? schoolName;

  PersonalInfoUserModel(
      {this.name, this.role, this.classroomName, this.schoolName});

  PersonalInfoUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    classroomName = json['classroom_name'];
    schoolName = json['school_name'];
  }
}
