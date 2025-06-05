import 'package:eschool_management/features/domain/entities/homeworks/homework_by_subject_entity.dart';

class HomeworkBySubjectModel extends HomeworkBySubjectEntity {
  String? title;
  String? description;
  String? attachmentUrl;
  String? dueDate;
  String? status;

  HomeworkBySubjectModel({
    this.title,
    this.description,
    this.attachmentUrl,
    this.dueDate,
    this.status,
  });

  HomeworkBySubjectModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    attachmentUrl = json['attachment_url'];
    dueDate = json['due_date'];
    status = json['status'];
  }

  static List<HomeworkBySubjectModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => HomeworkBySubjectModel.fromJson(json))
        .toList();
  }
}
