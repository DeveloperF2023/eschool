part of 'get_exams_by_day_cubit.dart';

sealed class GetExamsByDayState extends Equatable {
  const GetExamsByDayState();
}

final class GetExamsByDayInitial extends GetExamsByDayState {
  @override
  List<Object> get props => [];
}

final class GetExamsByDayLoading extends GetExamsByDayState {
  @override
  List<Object> get props => [];
}

final class GetExamsByDayLoaded extends GetExamsByDayState {
  final List<ExamsByDayEntity> exams;

  GetExamsByDayLoaded({required this.exams});
  @override
  List<Object> get props => [exams];
}

final class GetExamsByDayFailure extends GetExamsByDayState {
  final String message;

  GetExamsByDayFailure({required this.message});
  @override
  List<Object> get props => [];
}
