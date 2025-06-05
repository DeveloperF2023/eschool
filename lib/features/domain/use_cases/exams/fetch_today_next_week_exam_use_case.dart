import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_today_next_week_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTodayAndNextWeekExamUseCase {
  final Repository repository;

  FetchTodayAndNextWeekExamUseCase({required this.repository});

  Future<Either<Failure, List<ExamTodayAndNextWeekEntity>>> callback() {
    return repository.getTodayAndNextWeekExams();
  }
}
