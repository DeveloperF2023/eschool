import 'package:equatable/equatable.dart';

class ClassroomEntity extends Equatable {
  final int? id;
  final int? schoolId;
  final String? name;
  final String? section;
  final String? createdAt;
  final String? updatedAt;

  ClassroomEntity(
      {this.id,
      this.schoolId,
      this.name,
      this.section,
      this.createdAt,
      this.updatedAt});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, schoolId, name, section, createdAt, updatedAt];
}
