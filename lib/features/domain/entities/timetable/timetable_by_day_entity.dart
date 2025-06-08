import 'package:equatable/equatable.dart';

class TimetableByDayEntity extends Equatable {
  final int? subjectId;
  final String? subjectName;
  final String? startTime;
  final String? endTime;
  final String? teacherName;
  final String? teacherPicture;
  final String? status;
  final int? roomNumber;
  const TimetableByDayEntity({
    this.subjectId,
    this.subjectName,
    this.startTime,
    this.endTime,
    this.teacherName,
    this.teacherPicture,
    this.status,
    this.roomNumber,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    subjectId,
    subjectName,
    startTime,
    endTime,
    teacherName,
    teacherPicture,
    status,
    roomNumber,
  ];
}
