import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/exams/fetch_today_next_week_exam_use_case.dart';

import '../../../../domain/entities/exams/exams_today_next_week_entity.dart';

part 'get_today_next_week_exam_state.dart';

class GetTodayNextWeekExamCubit extends Cubit<GetTodayNextWeekExamState> {
  final FetchTodayAndNextWeekExamUseCase fetchTodayAndNextWeekExamsUseCase;
  GetTodayNextWeekExamCubit({required this.fetchTodayAndNextWeekExamsUseCase})
      : super(GetTodayNextWeekExamInitial());

  Future<void> getTodayAndNextWeekExams() async {
    emit(GetTodayNextWeekExamLoading());
    try {
      final result = await fetchTodayAndNextWeekExamsUseCase.callback();
      result.fold((l) => emit(GetTodayNextWeekExamFailure(message: l.message)),
          (r) => emit(GetTodayNextWeekExamLoaded(exams: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTodayNextWeekExamFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTodayNextWeekExamFailure(message: e.toString()));
    }
  }
}
