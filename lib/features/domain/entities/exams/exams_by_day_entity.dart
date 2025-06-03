import 'package:equatable/equatable.dart';

class ExamsByDayEntity extends Equatable {
  final String? startTime;
  final String? endTime;
  final String? title;
  final String? subjectName;
  final String? teacherName;
  final String? teacherPicture;
  final String? examDate;

  const ExamsByDayEntity({
    this.startTime,
    this.endTime,
    this.teacherName,
    this.subjectName,
    this.title,
    this.teacherPicture,
    this.examDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    startTime,
    endTime,
    title,
    subjectName,
    teacherName,
    teacherPicture,
    examDate,
  ];
}
