import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_today_and_next_week_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTodayAndNextWeekHomeworkUseCase {
  final Repository repository;

  FetchTodayAndNextWeekHomeworkUseCase({required this.repository});

  Future<Either<Failure, List<HomeworkTodayAndNextWeekEntity>>> callback() {
    return repository.getTodayAndNextWeekHomeworks();
  }
}
