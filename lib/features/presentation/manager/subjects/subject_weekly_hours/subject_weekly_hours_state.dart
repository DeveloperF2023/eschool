part of 'subject_weekly_hours_cubit.dart';

sealed class SubjectWeeklyHoursState extends Equatable {
  const SubjectWeeklyHoursState();
}

final class SubjectWeeklyHoursInitial extends SubjectWeeklyHoursState {
  @override
  List<Object> get props => [];
}

final class SubjectWeeklyHoursLoading extends SubjectWeeklyHoursState {
  @override
  List<Object> get props => [];
}

final class SubjectWeeklyHoursLoaded extends SubjectWeeklyHoursState {
  final SubjectWeeklyHoursEntity subjectWeeklyHours;

  SubjectWeeklyHoursLoaded({required this.subjectWeeklyHours});
  @override
  List<Object> get props => [subjectWeeklyHours];
}

final class SubjectWeeklyHoursFailure extends SubjectWeeklyHoursState {
  final String message;

  SubjectWeeklyHoursFailure({required this.message});
  @override
  List<Object> get props => [message];
}
