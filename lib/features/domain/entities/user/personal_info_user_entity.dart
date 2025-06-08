import 'package:equatable/equatable.dart';

class PersonalInfoUserEntity extends Equatable {
  final String? name;
  final String? role;
  final String? classroomName;
  final String? schoolName;

  const PersonalInfoUserEntity(
      {this.name, this.role, this.classroomName, this.schoolName});

  @override
  // TODO: implement props
  List<Object?> get props => [name, role, classroomName, schoolName];
}
