import 'package:eschool_management/features/domain/entities/exams/exams_today_next_week_entity.dart';

class ExamTodayNextWeekModel extends ExamTodayAndNextWeekEntity {
  int? id;
  String? title;
  String? examDate;
  String? teacherName;
  String? subjectName;
  String? startTime;
  String? endTime;

  ExamTodayNextWeekModel(
      {this.id,
      this.title,
      this.examDate,
      this.teacherName,
      this.subjectName,
      this.startTime,
      this.endTime});

  ExamTodayNextWeekModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    examDate = json['exam_date'];
    teacherName = json['teacher_name'];
    subjectName = json['subject_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  static List<ExamTodayNextWeekModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ExamTodayNextWeekModel.fromJson(json))
        .toList();
  }
}
