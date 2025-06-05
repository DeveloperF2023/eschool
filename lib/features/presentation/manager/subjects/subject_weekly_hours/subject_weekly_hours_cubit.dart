import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/subjects/fetch_subjects_weekly_hours_use_case.dart';

import '../../../../domain/entities/subjects/subject_weekly_hours_entity.dart';

part 'subject_weekly_hours_state.dart';

class SubjectWeeklyHoursCubit extends Cubit<SubjectWeeklyHoursState> {
  final FetchSubjectWeeklyHoursUseCase fetchSubjectWeeklyHoursUseCase;
  SubjectWeeklyHoursCubit({required this.fetchSubjectWeeklyHoursUseCase})
    : super(SubjectWeeklyHoursInitial());

  Future<void> getHomeworkBySubject({required int subjectId}) async {
    emit(SubjectWeeklyHoursLoading());
    try {
      final result = await fetchSubjectWeeklyHoursUseCase.callback(subjectId);
      result.fold(
        (l) => emit(SubjectWeeklyHoursFailure(message: l.message)),
        (r) => emit(SubjectWeeklyHoursLoaded(subjectWeeklyHours: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(SubjectWeeklyHoursFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(SubjectWeeklyHoursFailure(message: e.toString()));
    }
  }
}
