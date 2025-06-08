import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/events/fetch_event_by_id_use_case.dart';

import '../../../../domain/entities/events/event_entity.dart';

part 'get_detail_event_state.dart';

class GetDetailEventCubit extends Cubit<GetDetailEventState> {
  final FetchEventsByIdUseCase fetchEventsByIdUseCase;
  GetDetailEventCubit({required this.fetchEventsByIdUseCase})
    : super(GetDetailEventInitial());

  Future<void> getDetailEvent({required int eventId}) async {
    emit(GetDetailEventLoading());
    try {
      final result = await fetchEventsByIdUseCase.callback(eventId);
      result.fold(
        (l) => emit(GetDetailEventFailure(message: l.message)),
        (r) => emit(GetDetailEventLoaded(event: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetDetailEventFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetDetailEventFailure(message: e.toString()));
    }
  }
}
