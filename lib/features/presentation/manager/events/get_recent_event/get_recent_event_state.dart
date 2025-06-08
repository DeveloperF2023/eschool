part of 'get_recent_event_cubit.dart';

sealed class GetRecentEventState extends Equatable {
  const GetRecentEventState();
}

final class GetRecentEventInitial extends GetRecentEventState {
  @override
  List<Object> get props => [];
}

final class GetRecentEventLoading extends GetRecentEventState {
  @override
  List<Object> get props => [];
}

final class GetRecentEventLoaded extends GetRecentEventState {
  final List<EventEntity> events;

  const GetRecentEventLoaded({required this.events});
  @override
  List<Object> get props => [events];
}

final class GetRecentEventFailure extends GetRecentEventState {
  final String message;

  GetRecentEventFailure({required this.message});
  @override
  List<Object> get props => [message];
}
