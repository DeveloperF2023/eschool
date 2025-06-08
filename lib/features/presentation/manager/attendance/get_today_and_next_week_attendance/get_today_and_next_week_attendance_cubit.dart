import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/attendance/today_and_next_week_attendance_entity.dart';
import 'package:eschool_management/features/domain/use_cases/attendance/fetch_today_and_next_week_attendance_use_case.dart';

part 'get_today_and_next_week_attendance_state.dart';

class GetTodayAndNextWeekAttendanceCubit
    extends Cubit<GetTodayAndNextWeekAttendanceState> {
  final FetchTodayAndNextWeekAttendanceUseCase
      fetchTodayAndNextWeekAttendanceUseCase;
  GetTodayAndNextWeekAttendanceCubit(
      {required this.fetchTodayAndNextWeekAttendanceUseCase})
      : super(GetTodayAndNextWeekAttendanceInitial());

  Future<void> getTodayAndNextWeekAttendance() async {
    emit(GetTodayAndNextWeekAttendanceLoading());
    try {
      final result = await fetchTodayAndNextWeekAttendanceUseCase.callback();
      result.fold(
          (l) => emit(GetTodayAndNextWeekAttendanceFailure(message: l.message)),
          (r) => emit(GetTodayAndNextWeekAttendanceLoaded(attendance: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTodayAndNextWeekAttendanceFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTodayAndNextWeekAttendanceFailure(message: e.toString()));
    }
  }
}
