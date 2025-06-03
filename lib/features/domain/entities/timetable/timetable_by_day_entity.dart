import 'package:equatable/equatable.dart';

class TimetableByDayEntity extends Equatable {
  final String? subjectName;
  final String? startTime;
  final String? endTime;
  final String? teacherName;
  final String? teacherPicture;
  final String? status;
  const TimetableByDayEntity({
    this.subjectName,
    this.startTime,
    this.endTime,
    this.teacherName,
    this.teacherPicture,
    this.status,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    subjectName,
    startTime,
    endTime,
    teacherName,
    teacherPicture,
    status,
  ];
}
