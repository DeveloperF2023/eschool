import 'package:eschool_management/features/domain/entities/teacher_notes/teacher_note_entity.dart';

class TeacherNoteModel extends TeacherNoteEntity {
  int? id;
  int? teacherId;
  int? studentId;
  int? classId;
  int? subjectId;
  String? note;
  String? type;
  String? date;

  TeacherNoteModel({
    this.id,
    this.teacherId,
    this.studentId,
    this.classId,
    this.subjectId,
    this.note,
    this.type,
    this.date,
  });

  TeacherNoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    studentId = json['student_id'];
    classId = json['class_id'];
    subjectId = json['subject_id'];
    note = json['note'];
    type = json['type'];
    date = json['date'];
  }
  static List<TeacherNoteModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TeacherNoteModel.fromJson(json)).toList();
  }
}
