part of 'get_events_cubit.dart';

sealed class GetEventsState extends Equatable {
  const GetEventsState();
}

final class GetEventsInitial extends GetEventsState {
  @override
  List<Object> get props => [];
}

final class GetEventsLoading extends GetEventsState {
  @override
  List<Object> get props => [];
}

final class GetEventsSuccess extends GetEventsState {
  final List<EventEntity> events;

  GetEventsSuccess({required this.events});
  @override
  List<Object> get props => [events];
}

final class GetEventsFailure extends GetEventsState {
  final String message;

  GetEventsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
