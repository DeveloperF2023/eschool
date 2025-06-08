import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/teacher_notes/fetch_teacher_note_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/entities/teacher_notes/teacher_note_entity.dart';

part 'get_teacher_notes_state.dart';

class GetTeacherNotesCubit extends Cubit<GetTeacherNotesState> {
  final FetchTeacherNoteUseCase fetchTeacherNoteUseCase;
  GetTeacherNotesCubit({required this.fetchTeacherNoteUseCase})
    : super(GetTeacherNotesInitial());

  Future<void> getTeacherNotes({required int subjectId}) async {
    emit(GetTeacherNotesLoading());
    try {
      final result = await fetchTeacherNoteUseCase.callback(subjectId);
      final prefs = await SharedPreferences.getInstance();
      final studentId = prefs.getInt('studentId');
      result.fold(
        (l) => emit(GetTeacherNotesFailure(message: l.message)),
        (r) =>
            emit(GetTeacherNotesLoaded(teacherNotes: r, studentId: studentId)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTeacherNotesFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTeacherNotesFailure(message: e.toString()));
    }
  }
}
