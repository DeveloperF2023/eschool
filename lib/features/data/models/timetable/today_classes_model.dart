import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/subjects/subject_model.dart';
import 'package:eschool_management/features/domain/entities/timetable/today_classes_entity.dart';

class TodayClassesModel extends TodayClassesEntity {
  int? id;
  int? classroomId;
  int? subjectId;
  String? weekday;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  ClassroomModel? classroom;
  SubjectModel? subject;

  TodayClassesModel(
      {this.id,
      this.classroomId,
      this.subjectId,
      this.weekday,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.classroom,
      this.subject});

  TodayClassesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classroomId = json['classroom_id'];
    subjectId = json['subject_id'];
    weekday = json['weekday'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    classroom = json['classroom'] != null
        ? ClassroomModel.fromJson(json['classroom'])
        : null;
    subject =
        json['subject'] != null ? SubjectModel.fromJson(json['subject']) : null;
  }
  static List<TodayClassesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TodayClassesModel.fromJson(json)).toList();
  }
}
