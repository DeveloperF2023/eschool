import 'package:equatable/equatable.dart';

class HomeworkBySubjectEntity extends Equatable {
  String? title;
  String? description;
  String? attachmentUrl;
  String? dueDate;
  String? status;
  HomeworkBySubjectEntity({
    this.title,
    this.description,
    this.attachmentUrl,
    this.dueDate,
    this.status,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    description,
    attachmentUrl,
    dueDate,
    status,
  ];
}
