part of 'request_code_cubit.dart';

sealed class RequestCodeState extends Equatable {
  const RequestCodeState();
}

final class RequestCodeInitial extends RequestCodeState {
  @override
  List<Object> get props => [];
}

final class RequestCodeLoading extends RequestCodeState {
  @override
  List<Object> get props => [];
}

final class RequestCodeLoaded extends RequestCodeState {
  final String message;

  const RequestCodeLoaded({required this.message});
  @override
  List<Object> get props => [message];
}

final class RequestCodeFailure extends RequestCodeState {
  final String errorMessage;

  const RequestCodeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
