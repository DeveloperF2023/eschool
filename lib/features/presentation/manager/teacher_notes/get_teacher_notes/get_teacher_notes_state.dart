part of 'get_teacher_notes_cubit.dart';

sealed class GetTeacherNotesState extends Equatable {
  const GetTeacherNotesState();
}

final class GetTeacherNotesInitial extends GetTeacherNotesState {
  @override
  List<Object> get props => [];
}

final class GetTeacherNotesLoading extends GetTeacherNotesState {
  @override
  List<Object> get props => [];
}

final class GetTeacherNotesLoaded extends GetTeacherNotesState {
  final List<TeacherNoteEntity> teacherNotes;
  final int? studentId;
  const GetTeacherNotesLoaded({required this.teacherNotes, this.studentId});
  @override
  List<Object> get props => [teacherNotes];
}

final class GetTeacherNotesFailure extends GetTeacherNotesState {
  final String message;

  GetTeacherNotesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
