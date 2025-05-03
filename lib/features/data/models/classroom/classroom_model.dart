import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';

class ClassroomModel extends ClassroomEntity {
  int? id;
  int? schoolId;
  String? name;
  String? section;
  String? createdAt;
  String? updatedAt;

  ClassroomModel(
      {this.id,
      this.schoolId,
      this.name,
      this.section,
      this.createdAt,
      this.updatedAt});

  ClassroomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    name = json['name'];
    section = json['section'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  static List<ClassroomModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ClassroomModel.fromJson(json)).toList();
  }
}
