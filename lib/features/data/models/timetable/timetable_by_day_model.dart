import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';

class TimetableByDayModel extends TimetableByDayEntity {
  int? subjectId;
  String? subjectName;
  String? startTime;
  String? endTime;
  String? teacherName;
  String? teacherPicture;
  String? status;
  int? roomNumber;
  TimetableByDayModel({
    this.subjectId,
    this.subjectName,
    this.startTime,
    this.endTime,
    this.teacherPicture,
    this.teacherName,
    this.status,
    this.roomNumber,
  });

  factory TimetableByDayModel.fromJson(Map<String, dynamic> json) {
    return TimetableByDayModel(
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      teacherName: json['teacher_name'],
      teacherPicture: json['teacher_picture'],
      status: json['status'],
      roomNumber: json['room_number'],
    );
  }

  static List<TimetableByDayModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TimetableByDayModel.fromJson(json)).toList();
  }
}
