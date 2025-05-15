import 'package:equatable/equatable.dart';

class TodayAndNextWeekAttendanceEntity extends Equatable {
  final int? id;
  final int? studentId;
  final int? classId;
  final String? date;
  final String? status;
  final String? remarks;
  final String? createdAt;
  final String? updatedAt;

  const TodayAndNextWeekAttendanceEntity(
      {this.id,
      this.studentId,
      this.classId,
      this.date,
      this.status,
      this.remarks,
      this.createdAt,
      this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, studentId, classId, date, status, remarks, createdAt, updatedAt];
}
