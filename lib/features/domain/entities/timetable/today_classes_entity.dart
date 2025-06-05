import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/subjects/subject_entity.dart';

class TodayClassesEntity extends Equatable {
  final int? id;
  final int? classroomId;
  final int? subjectId;
  final String? weekday;
  final String? startTime;
  final String? endTime;
  final String? createdAt;
  final String? updatedAt;
  final ClassroomEntity? classroom;
  final SubjectEntity? subject;

  const TodayClassesEntity(
      {this.id,
      this.classroomId,
      this.subjectId,
      this.weekday,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.classroom,
      this.subject});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        classroomId,
        subjectId,
        weekday,
        startTime,
        endTime,
        createdAt,
        updatedAt,
        classroom,
        subject
      ];
}
