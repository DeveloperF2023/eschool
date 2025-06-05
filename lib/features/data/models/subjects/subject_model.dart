import 'package:eschool_management/features/domain/entities/subjects/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  int? id;
  String? name;
  int? classId;
  int? teacherId;
  String? createdAt;
  String? updatedAt;

  SubjectModel(
      {this.id,
      this.name,
      this.classId,
      this.teacherId,
      this.createdAt,
      this.updatedAt});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      classId: json['class_id'],
      teacherId: json['teacher_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
