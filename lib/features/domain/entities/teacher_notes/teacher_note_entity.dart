import 'package:equatable/equatable.dart';

class TeacherNoteEntity extends Equatable {
  final int? id;
  final int? teacherId;
  final int? studentId;
  final int? classId;
  final int? subjectId;
  final String? note;
  final String? type;
  final String? date;

  TeacherNoteEntity({
    this.id,
    this.teacherId,
    this.studentId,
    this.classId,
    this.subjectId,
    this.note,
    this.type,
    this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    teacherId,
    studentId,
    classId,
    subjectId,
    note,
    type,
    date,
  ];
}
