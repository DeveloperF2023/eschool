import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_by_day_entity.dart';
import 'package:eschool_management/features/domain/use_cases/exams/fetch_exams_by_day_use_case.dart';

part 'get_exams_by_day_state.dart';

class GetExamsByDayCubit extends Cubit<GetExamsByDayState> {
  final FetchExamsByDayUseCase fetchExamsByDayUseCase;
  GetExamsByDayCubit({required this.fetchExamsByDayUseCase})
    : super(GetExamsByDayInitial());
  Future<void> getTodayAndNextWeekExams({required DateTime examDate}) async {
    emit(GetExamsByDayLoading());
    try {
      final result = await fetchExamsByDayUseCase.callback(examDate);
      result.fold(
        (l) => emit(GetExamsByDayFailure(message: l.message)),
        (r) => emit(GetExamsByDayLoaded(exams: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetExamsByDayFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetExamsByDayFailure(message: e.toString()));
    }
  }
}
