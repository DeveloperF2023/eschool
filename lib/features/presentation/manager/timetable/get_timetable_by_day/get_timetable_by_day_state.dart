part of 'get_timetable_by_day_cubit.dart';

sealed class GetTimetableByDayState extends Equatable {
  const GetTimetableByDayState();
}

final class GetTimetableByDayInitial extends GetTimetableByDayState {
  @override
  List<Object> get props => [];
}

final class GetTimetableByDayLoading extends GetTimetableByDayState {
  @override
  List<Object> get props => [];
}

final class GetTimetableByDayLoaded extends GetTimetableByDayState {
  final List<TimetableByDayEntity> timetable;

  GetTimetableByDayLoaded({required this.timetable});
  @override
  List<Object> get props => [timetable];
}

final class GetTimetableByDayFailure extends GetTimetableByDayState {
  final String error;

  GetTimetableByDayFailure({required this.error});
  @override
  List<Object> get props => [error];
}
