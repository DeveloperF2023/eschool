part of 'get_today_events_cubit.dart';

sealed class GetTodayEventsState extends Equatable {
  const GetTodayEventsState();
}

final class GetTodayEventsInitial extends GetTodayEventsState {
  @override
  List<Object> get props => [];
}

final class GetTodayEventsLoading extends GetTodayEventsState {
  @override
  List<Object> get props => [];
}

final class GetTodayEventsLoaded extends GetTodayEventsState {
  final List<EventEntity> events;

  GetTodayEventsLoaded({required this.events});
  @override
  List<Object> get props => [events];
}

final class GetTodayEventsFailure extends GetTodayEventsState {
  final String message;

  GetTodayEventsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
