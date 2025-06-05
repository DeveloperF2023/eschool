part of 'my_homeworks_by_day_cubit.dart';

sealed class MyHomeworksByDayState extends Equatable {
  const MyHomeworksByDayState();
}

final class MyHomeworksByDayInitial extends MyHomeworksByDayState {
  @override
  List<Object> get props => [];
}

final class MyHomeworksByDayLoading extends MyHomeworksByDayState {
  @override
  List<Object> get props => [];
}

final class MyHomeworksByDayLoaded extends MyHomeworksByDayState {
  final List<HomeworkByDayEntity> homeworks;

  const MyHomeworksByDayLoaded({required this.homeworks});
  @override
  List<Object> get props => [homeworks];
}

final class MyHomeworksByDayFailure extends MyHomeworksByDayState {
  final String message;

  const MyHomeworksByDayFailure({required this.message});
  @override
  List<Object> get props => [message];
}
