import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_today_next_week_entity.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';
import 'package:eschool_management/features/domain/entities/timetable/today_classes_entity.dart';

import '../../../core/error/failure.dart';
import '../entities/events/event_entity.dart';
import '../entities/user/user_entity.dart';

abstract class Repository {
  /// Users
  Future<Either<Failure, UserEntity>> login(String code);
  Future<Either<Failure, String>> requestCode(
      String email, String role, int classroomId);
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo();
  Future<bool> isSignInUser();
  Future<String> getCurrentTokenUser();

  ///Schools Repository
  Future<Either<Failure, List<SchoolEntity>>> getSchools();

  ///Classrooms Repository
  Future<Either<Failure, List<ClassroomEntity>>> getClassroomBySchoolId(
      int schoolId);

  ///Timetable Repository
  Future<Either<Failure, List<TodayClassesEntity>>> getTodayClasses();

  ///Events Repository
  Future<Either<Failure, List<EventEntity>>> getEvents();

  ///Exams
  Future<Either<Failure, List<ExamTodayAndNextWeekEntity>>>
      getTodayAndNextWeekExams();
}
