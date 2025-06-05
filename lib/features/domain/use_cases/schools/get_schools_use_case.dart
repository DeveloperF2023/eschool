import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchSchoolsUseCase {
  final Repository repository;

  FetchSchoolsUseCase({required this.repository});

  Future<Either<Failure, List<SchoolEntity>>> callback() {
    return repository.getSchools();
  }
}
