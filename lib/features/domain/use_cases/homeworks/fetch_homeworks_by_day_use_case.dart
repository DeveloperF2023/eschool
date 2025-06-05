import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_day_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchHomeworkByDayUseCase {
  final Repository repository;

  FetchHomeworkByDayUseCase({required this.repository});

  Future<Either<Failure, List<HomeworkByDayEntity>>> callback(
    DateTime dueDate,
  ) {
    return repository.getHomeworkByDay(dueDate);
  }
}
