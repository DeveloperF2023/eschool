import 'package:eschool_management/features/domain/entities/exams/exams_by_day_entity.dart';

class ExamsByDayModel extends ExamsByDayEntity {
  String? startTime;
  String? endTime;
  String? title;
  String? subjectName;
  String? teacherName;
  String? teacherPicture;
  String? examDate;

  ExamsByDayModel({
    this.startTime,
    this.endTime,
    this.title,
    this.subjectName,
    this.teacherName,
    this.teacherPicture,
    this.examDate,
  });

  factory ExamsByDayModel.fromJson(Map<String, dynamic> json) {
    return ExamsByDayModel(
      startTime: json['start_time'],
      endTime: json['end_time'],
      title: json['title'],
      subjectName: json['subject_name'],
      teacherName: json['teacher_name'],
      teacherPicture: json['teacher_picture'],
      examDate: json['exam_date'],
    );
  }
  static List<ExamsByDayModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ExamsByDayModel.fromJson(json)).toList();
  }
}
