part of 'homework_by_subject_cubit.dart';

sealed class HomeworkBySubjectState extends Equatable {
  const HomeworkBySubjectState();
}

final class HomeworkBySubjectInitial extends HomeworkBySubjectState {
  @override
  List<Object> get props => [];
}

final class HomeworkBySubjectLoading extends HomeworkBySubjectState {
  @override
  List<Object> get props => [];
}

final class HomeworkBySubjectLoaded extends HomeworkBySubjectState {
  final List<HomeworkBySubjectEntity> homeworks;

  const HomeworkBySubjectLoaded({required this.homeworks});
  @override
  List<Object> get props => [homeworks];
}

final class HomeworkBySubjectFailure extends HomeworkBySubjectState {
  final String message;

  const HomeworkBySubjectFailure({required this.message});
  @override
  List<Object> get props => [message];
}
