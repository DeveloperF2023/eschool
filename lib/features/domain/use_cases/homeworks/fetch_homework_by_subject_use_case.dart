import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_subject_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchHomeworkBySubjectUseCase {
  final Repository repository;

  FetchHomeworkBySubjectUseCase({required this.repository});

  Future<Either<Failure, List<HomeworkBySubjectEntity>>> callback(
    int subjectId,
  ) {
    return repository.getHomeworkBySubject(subjectId);
  }
}
