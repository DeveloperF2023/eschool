part of 'get_today_next_week_exam_cubit.dart';

sealed class GetTodayNextWeekExamState extends Equatable {
  const GetTodayNextWeekExamState();
}

final class GetTodayNextWeekExamInitial extends GetTodayNextWeekExamState {
  @override
  List<Object> get props => [];
}

final class GetTodayNextWeekExamLoading extends GetTodayNextWeekExamState {
  @override
  List<Object> get props => [];
}

final class GetTodayNextWeekExamLoaded extends GetTodayNextWeekExamState {
  final List<ExamTodayAndNextWeekEntity> exams;

  GetTodayNextWeekExamLoaded({required this.exams});
  @override
  List<Object> get props => [exams];
}

final class GetTodayNextWeekExamFailure extends GetTodayNextWeekExamState {
  final String message;

  GetTodayNextWeekExamFailure({required this.message});
  @override
  List<Object> get props => [message];
}
