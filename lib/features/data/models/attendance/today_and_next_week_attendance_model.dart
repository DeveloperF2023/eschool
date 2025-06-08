import 'package:eschool_management/features/domain/entities/attendance/today_and_next_week_attendance_entity.dart';

class TodayAndNextWeekAttendanceModel extends TodayAndNextWeekAttendanceEntity {
  int? id;
  int? studentId;
  int? classId;
  String? date;
  String? status;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  TodayAndNextWeekAttendanceModel(
      {this.id,
      this.studentId,
      this.classId,
      this.date,
      this.status,
      this.remarks,
      this.createdAt,
      this.updatedAt});

  factory TodayAndNextWeekAttendanceModel.fromJson(Map<String, dynamic> json) {
    return TodayAndNextWeekAttendanceModel(
      id: json['id'],
      studentId: json['student_id'],
      classId: json['class_id'],
      date: json['date'],
      status: json['status'],
      remarks: json['remarks'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  static List<TodayAndNextWeekAttendanceModel> fromJsonList(
      List<dynamic> jsonList) {
    return jsonList
        .map((json) => TodayAndNextWeekAttendanceModel.fromJson(json))
        .toList();
  }
}
