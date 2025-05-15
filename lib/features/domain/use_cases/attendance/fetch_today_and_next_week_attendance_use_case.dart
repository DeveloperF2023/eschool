import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/attendance/today_and_next_week_attendance_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTodayAndNextWeekAttendanceUseCase {
  final Repository repository;

  FetchTodayAndNextWeekAttendanceUseCase({required this.repository});

  Future<Either<Failure, List<TodayAndNextWeekAttendanceEntity>>> callback() {
    return repository.getTodayAndNextWeekAttendance();
  }
}
