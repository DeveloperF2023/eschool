import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final int? id;
  final String? name;
  final int? classId;
  final int? teacherId;
  final String? createdAt;
  final String? updatedAt;

  SubjectEntity(
      {this.id,
      this.name,
      this.classId,
      this.teacherId,
      this.createdAt,
      this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, classId, teacherId, createdAt, updatedAt];
}
