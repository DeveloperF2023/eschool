import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/events/event_entity.dart';
import '../../../../domain/use_cases/events/fetch_today_events_use_case.dart';

part 'get_today_events_state.dart';

class GetTodayEventsCubit extends Cubit<GetTodayEventsState> {
  final FetchTodayEventsUseCase fetchTodayEventsUseCase;
  GetTodayEventsCubit({required this.fetchTodayEventsUseCase})
    : super(GetTodayEventsInitial());

  Future<void> getTodayEvents() async {
    emit(GetTodayEventsLoading());
    try {
      final result = await fetchTodayEventsUseCase.callback();
      result.fold(
        (l) => emit(GetTodayEventsFailure(message: l.message)),
        (r) => emit(GetTodayEventsLoaded(events: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTodayEventsFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTodayEventsFailure(message: e.toString()));
    }
  }
}
