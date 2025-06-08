import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_by_day_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchExamsByDayUseCase {
  final Repository repository;

  FetchExamsByDayUseCase({required this.repository});

  Future<Either<Failure, List<ExamsByDayEntity>>> callback(DateTime examDate) {
    return repository.getExamsByDay(examDate);
  }
}
