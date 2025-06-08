part of 'get_detail_event_cubit.dart';

sealed class GetDetailEventState extends Equatable {
  const GetDetailEventState();
}

final class GetDetailEventInitial extends GetDetailEventState {
  @override
  List<Object> get props => [];
}

final class GetDetailEventLoading extends GetDetailEventState {
  @override
  List<Object> get props => [];
}

final class GetDetailEventLoaded extends GetDetailEventState {
  final EventEntity event;

  GetDetailEventLoaded({required this.event});
  @override
  List<Object> get props => [event];
}

final class GetDetailEventFailure extends GetDetailEventState {
  final String message;

  GetDetailEventFailure({required this.message});
  @override
  List<Object> get props => [message];
}
