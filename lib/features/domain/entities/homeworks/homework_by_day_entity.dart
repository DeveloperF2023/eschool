import 'package:equatable/equatable.dart';

class HomeworkByDayEntity extends Equatable {
  final String? title;
  final String? description;
  final String? dueDate;
  final String? subjectName;
  final String? teacherName;
  final String? teacherPicture;
  final String? attachment;

  const HomeworkByDayEntity({
    this.title,
    this.description,
    this.teacherPicture,
    this.teacherName,
    this.subjectName,
    this.dueDate,
    this.attachment,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    description,
    teacherPicture,
    teacherName,
    subjectName,
    dueDate,
    attachment,
  ];
}
