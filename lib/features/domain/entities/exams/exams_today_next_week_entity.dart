import 'package:equatable/equatable.dart';

class ExamTodayAndNextWeekEntity extends Equatable {
  final int? id;
  final String? title;
  final String? examDate;
  final String? teacherName;
  final String? subjectName;
  final String? startTime;
  final String? endTime;

  ExamTodayAndNextWeekEntity(
      {this.id,
      this.title,
      this.examDate,
      this.teacherName,
      this.subjectName,
      this.startTime,
      this.endTime});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, examDate, teacherName, subjectName, startTime, endTime];
}
