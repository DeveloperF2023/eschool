import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';

import '../../../core/error/failure.dart';
import '../entities/user/user_entity.dart';

abstract class Repository {
  /// Users
  Future<Either<Failure, UserEntity>> login(String code);
  Future<Either<Failure, String>> requestCode(
      String email, String role, int classroomId);

  ///Schools Repository
  Future<Either<Failure, List<SchoolEntity>>> getSchools();

  ///Classrooms Repository
  Future<Either<Failure, List<ClassroomEntity>>> getClassroomBySchoolId(
      int schoolId);
}
