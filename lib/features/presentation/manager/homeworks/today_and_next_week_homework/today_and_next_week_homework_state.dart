part of 'today_and_next_week_homework_cubit.dart';

sealed class TodayAndNextWeekHomeworkState extends Equatable {
  const TodayAndNextWeekHomeworkState();
}

final class TodayAndNextWeekHomeworkInitial
    extends TodayAndNextWeekHomeworkState {
  @override
  List<Object> get props => [];
}

final class TodayAndNextWeekHomeworkLoading
    extends TodayAndNextWeekHomeworkState {
  @override
  List<Object> get props => [];
}

final class TodayAndNextWeekHomeworkLoaded
    extends TodayAndNextWeekHomeworkState {
  final List<HomeworkTodayAndNextWeekEntity> homeworks;

  const TodayAndNextWeekHomeworkLoaded({required this.homeworks});
  @override
  List<Object> get props => [];
}

final class TodayAndNextWeekHomeworkFailure
    extends TodayAndNextWeekHomeworkState {
  final String message;

  TodayAndNextWeekHomeworkFailure({required this.message});
  @override
  List<Object> get props => [message];
}
