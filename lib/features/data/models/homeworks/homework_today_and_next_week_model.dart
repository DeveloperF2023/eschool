import 'package:eschool_management/features/domain/entities/homeworks/homework_today_and_next_week_entity.dart';

class HomeworkTodayAndNextWeekModel extends HomeworkTodayAndNextWeekEntity {
  String? title;
  String? description;
  String? dueDate;
  String? classroomName;
  String? teacherName;
  String? subjectName;

  HomeworkTodayAndNextWeekModel(
      {this.title,
      this.description,
      this.dueDate,
      this.classroomName,
      this.teacherName,
      this.subjectName});

  factory HomeworkTodayAndNextWeekModel.fromJson(Map<String, dynamic> json) {
    return HomeworkTodayAndNextWeekModel(
      title: json['title'],
      description: json['description'],
      dueDate: json['due_date'],
      classroomName: json['classroom_name'],
      teacherName: json['teacher_name'],
      subjectName: json['subject_name'],
    );
  }
  static List<HomeworkTodayAndNextWeekModel> fromJsonList(
      List<dynamic> jsonList) {
    return jsonList
        .map((json) => HomeworkTodayAndNextWeekModel.fromJson(json))
        .toList();
  }
}
