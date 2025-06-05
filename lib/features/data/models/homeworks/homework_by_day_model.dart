import 'package:eschool_management/features/domain/entities/homeworks/homework_by_day_entity.dart';

class HomeworksByDayModel extends HomeworkByDayEntity {
  String? title;
  String? description;
  String? dueDate;
  String? subjectName;
  String? teacherName;
  String? teacherPicture;
  String? attachment;

  HomeworksByDayModel({
    this.title,
    this.description,
    this.dueDate,
    this.subjectName,
    this.teacherName,
    this.teacherPicture,
    this.attachment,
  });

  factory HomeworksByDayModel.fromJson(Map<String, dynamic> json) {
    return HomeworksByDayModel(
      title: json['title'],
      description: json['description'],
      dueDate: json['due_date'],
      subjectName: json['subject_name'],
      teacherName: json['teacher_name'],
      teacherPicture: json['teacher_picture'],
      attachment: json['attachment'],
    );
  }
  static List<HomeworksByDayModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HomeworksByDayModel.fromJson(json)).toList();
  }
}
