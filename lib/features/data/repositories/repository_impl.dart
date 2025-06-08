import 'package:dartz/dartz.dart';
import 'package:eschool_management/core/error/failure.dart';
import 'package:eschool_management/features/domain/entities/attendance/today_and_next_week_attendance_entity.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_today_next_week_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_subject_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_today_and_next_week_entity.dart';
import 'package:eschool_management/features/domain/entities/resources/resource_entity.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';
import 'package:eschool_management/features/domain/entities/subjects/subject_weekly_hours_entity.dart';
import 'package:eschool_management/features/domain/entities/teacher_notes/teacher_note_entity.dart';
import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/timetable/today_classes_entity.dart';
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
    } on Exception catch (e) {
      return Left(ServerFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> requestCode(
    String email,
    String role,
    int classroomId,
  ) async {
    try {
      final result = await remoteDataSource.requestCode(
        email,
        role,
        classroomId,
      );
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
    int schoolId,
  ) async {
    try {
      final result = await remoteDataSource.getClassroomBySchoolId(schoolId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo() async {
    try {
      final result = await remoteDataSource.getUserInfo();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<String> getCurrentTokenUser() async =>
      remoteDataSource.getCurrentTokenUser();

  @override
  Future<bool> isSignInUser() async => remoteDataSource.isSignInUser();

  @override
  Future<Either<Failure, List<TodayClassesEntity>>> getTodayClasses() async {
    try {
      final result = await remoteDataSource.getTodayClasses();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents() async {
    try {
      final result = await remoteDataSource.getUpcomingEvents();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ExamTodayAndNextWeekEntity>>>
  getTodayAndNextWeekExams() async {
    try {
      final result = await remoteDataSource.getTodayAndNextWeekExams();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<HomeworkTodayAndNextWeekEntity>>>
  getTodayAndNextWeekHomeworks() async {
    try {
      final result = await remoteDataSource.getTodayAndNextWeekHomeworks();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<TodayAndNextWeekAttendanceEntity>>>
  getTodayAndNextWeekAttendance() async {
    try {
      final result = await remoteDataSource.getTodayAndNextWeekAttendance();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<TimetableByDayEntity>>> getTimetableByDay(
    String day,
  ) async {
    try {
      final result = await remoteDataSource.getTimetableByDay(day);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<HomeworkByDayEntity>>> getHomeworkByDay(
    DateTime dueDate,
  ) async {
    try {
      final result = await remoteDataSource.getHomeworkByDay(dueDate);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ExamsByDayEntity>>> getExamsByDay(
    DateTime examDate,
  ) async {
    try {
      final result = await remoteDataSource.getExamsByDay(examDate);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<HomeworkBySubjectEntity>>> getHomeworkBySubject(
    int subjectId,
  ) async {
    try {
      final result = await remoteDataSource.getHomeworkBySubject(subjectId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, SubjectWeeklyHoursEntity>> getSubjectWeeklyHours(
    int subjectId,
  ) async {
    try {
      final result = await remoteDataSource.getSubjectWeeklyHours(subjectId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ResourceEntity>>> getResource(
    int subjectId,
  ) async {
    try {
      final result = await remoteDataSource.getResourcesBySubject(subjectId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<TeacherNoteEntity>>> getTeacherNotes(
    int subjectId,
  ) async {
    try {
      final result = await remoteDataSource.getTeacherNotesBySubject(subjectId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getRecentEvents() async {
    try {
      final result = await remoteDataSource.getRecentEvents();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getTodayEvents() async {
    try {
      final result = await remoteDataSource.getTodayEvents();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getDetailEvent(int eventId) async {
    try {
      final result = await remoteDataSource.getEventsById(eventId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }
}
