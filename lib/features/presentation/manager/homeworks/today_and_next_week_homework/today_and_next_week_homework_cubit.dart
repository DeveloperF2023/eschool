import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_today_and_next_week_entity.dart';
import 'package:eschool_management/features/domain/use_cases/homeworks/fetch_today_and_next_week_homeworks_use_case.dart';

part 'today_and_next_week_homework_state.dart';

class TodayAndNextWeekHomeworkCubit
    extends Cubit<TodayAndNextWeekHomeworkState> {
  final FetchTodayAndNextWeekHomeworkUseCase
      fetchTodayAndNextWeekHomeworkUseCase;
  TodayAndNextWeekHomeworkCubit(
      {required this.fetchTodayAndNextWeekHomeworkUseCase})
      : super(TodayAndNextWeekHomeworkInitial());
  Future<void> getTodayAndNextWeekExams() async {
    emit(TodayAndNextWeekHomeworkLoading());
    try {
      final result = await fetchTodayAndNextWeekHomeworkUseCase.callback();
      result.fold(
          (l) => emit(TodayAndNextWeekHomeworkFailure(message: l.message)),
          (r) => emit(TodayAndNextWeekHomeworkLoaded(homeworks: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(TodayAndNextWeekHomeworkFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(TodayAndNextWeekHomeworkFailure(message: e.toString()));
    }
  }
}
