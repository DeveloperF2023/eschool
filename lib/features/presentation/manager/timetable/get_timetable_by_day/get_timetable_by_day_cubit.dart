import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';
import 'package:eschool_management/features/domain/use_cases/timetable/fetch_timetable_by_day_use_case.dart';

part 'get_timetable_by_day_state.dart';

class GetTimetableByDayCubit extends Cubit<GetTimetableByDayState> {
  final FetchTimetableByDayUseCase fetchTimetableByDayUseCase;
  GetTimetableByDayCubit({required this.fetchTimetableByDayUseCase})
    : super(GetTimetableByDayInitial());

  Future<void> getTimetableByDay({required day}) async {
    emit(GetTimetableByDayLoading());
    try {
      final result = await fetchTimetableByDayUseCase.callback(day);
      result.fold(
        (l) => emit(GetTimetableByDayFailure(error: l.message)),
        (r) => emit(GetTimetableByDayLoaded(timetable: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTimetableByDayFailure(error: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTimetableByDayFailure(error: e.toString()));
    }
  }
}
