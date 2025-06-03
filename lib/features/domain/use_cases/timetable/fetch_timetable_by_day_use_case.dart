import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTimetableByDayUseCase {
  final Repository repository;

  FetchTimetableByDayUseCase({required this.repository});

  Future<Either<Failure, List<TimetableByDayEntity>>> callback(String day) {
    return repository.getTimetableByDay(day);
  }
}
