import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/events/fetch_recent_event_use_case.dart';

import '../../../../domain/entities/events/event_entity.dart';

part 'get_recent_event_state.dart';

class GetRecentEventCubit extends Cubit<GetRecentEventState> {
  final FetchRecentEventsUseCase fetchRecentEventsUseCase;
  GetRecentEventCubit({required this.fetchRecentEventsUseCase})
    : super(GetRecentEventInitial());

  Future<void> getRecentEvents() async {
    emit(GetRecentEventLoading());
    try {
      final result = await fetchRecentEventsUseCase.callback();
      result.fold(
        (l) => emit(GetRecentEventFailure(message: l.message)),
        (r) => emit(GetRecentEventLoaded(events: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetRecentEventFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetRecentEventFailure(message: e.toString()));
    }
  }
}
