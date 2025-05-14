import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';

import '../../../../domain/use_cases/events/fetch_events_use_case.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  final FetchEventsUseCase fetchEventsUseCase;

  GetEventsCubit({required this.fetchEventsUseCase})
      : super(GetEventsInitial());

  Future<void> getEvents() async {
    emit(GetEventsLoading());
    try {
      final result = await fetchEventsUseCase.callback();
      result.fold((l) => emit(GetEventsFailure(message: l.message)),
          (r) => emit(GetEventsSuccess(events: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetEventsFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetEventsFailure(message: e.toString()));
    }
  }
}
