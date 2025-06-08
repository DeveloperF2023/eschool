import 'package:equatable/equatable.dart';

class HomeworkTodayAndNextWeekEntity extends Equatable {
  final String? title;
  final String? description;
  final String? dueDate;
  final String? classroomName;
  final String? teacherName;
  final String? teacherImage;
  final String? subjectName;

  const HomeworkTodayAndNextWeekEntity(
      {this.title,
      this.description,
      this.dueDate,
      this.classroomName,
      this.teacherName,
      this.subjectName,
      this.teacherImage});

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        description,
        dueDate,
        classroomName,
        teacherName,
        subjectName,
        teacherImage
      ];
}
