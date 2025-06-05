import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchClassroomBySchoolIdUseCase {
  final Repository repository;

  FetchClassroomBySchoolIdUseCase({required this.repository});

  Future<Either<Failure, List<ClassroomEntity>>> callback(int schoolId) {
    return repository.getClassroomBySchoolId(schoolId);
  }
}
