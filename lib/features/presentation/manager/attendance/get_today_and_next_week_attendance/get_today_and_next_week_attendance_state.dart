part of 'get_today_and_next_week_attendance_cubit.dart';

sealed class GetTodayAndNextWeekAttendanceState extends Equatable {
  const GetTodayAndNextWeekAttendanceState();
}

final class GetTodayAndNextWeekAttendanceInitial
    extends GetTodayAndNextWeekAttendanceState {
  @override
  List<Object> get props => [];
}

final class GetTodayAndNextWeekAttendanceLoading
    extends GetTodayAndNextWeekAttendanceState {
  @override
  List<Object> get props => [];
}

final class GetTodayAndNextWeekAttendanceLoaded
    extends GetTodayAndNextWeekAttendanceState {
  final List<TodayAndNextWeekAttendanceEntity> attendance;

  const GetTodayAndNextWeekAttendanceLoaded({required this.attendance});
  @override
  List<Object> get props => [attendance];
}

final class GetTodayAndNextWeekAttendanceFailure
    extends GetTodayAndNextWeekAttendanceState {
  final String message;

  GetTodayAndNextWeekAttendanceFailure({required this.message});
  @override
  List<Object> get props => [message];
}
