import 'package:dartz/dartz.dart';
import 'package:eschool_management/core/error/failure.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';
import 'package:eschool_management/features/domain/entities/user/user_entity.dart';

import '../../domain/repositories/repository.dart';
import '../data_sources/remote_data_source_impl.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSourceImpl remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> login(String code) async {
    try {
      final result = await remoteDataSource.loginUser(code);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> requestCode(
      String email, String role, int classroomId) async {
    try {
      final result =
          await remoteDataSource.requestCode(email, role, classroomId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<SchoolEntity>>> getSchools() async {
    try {
      final result = await remoteDataSource.getSchools();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ClassroomEntity>>> getClassroomBySchoolId(
      int schoolId) async {
    try {
      final result = await remoteDataSource.getClassroomBySchoolId(schoolId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }
}
