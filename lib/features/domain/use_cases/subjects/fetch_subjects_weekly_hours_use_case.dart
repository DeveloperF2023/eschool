import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/subjects/subject_weekly_hours_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchSubjectWeeklyHoursUseCase {
  final Repository repository;

  FetchSubjectWeeklyHoursUseCase({required this.repository});

  Future<Either<Failure, SubjectWeeklyHoursEntity>> callback(int subjectId) {
    return repository.getSubjectWeeklyHours(subjectId);
  }
}
