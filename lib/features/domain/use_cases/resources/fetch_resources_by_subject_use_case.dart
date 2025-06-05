import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/resources/resource_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchResourcesBySubjectUseCase {
  final Repository repository;

  FetchResourcesBySubjectUseCase({required this.repository});

  Future<Either<Failure, List<ResourceEntity>>> callback(int subjectId) {
    return repository.getResource(subjectId);
  }
}
