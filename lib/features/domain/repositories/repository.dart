import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/exams/exams_today_next_week_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_subject_entity.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_today_and_next_week_entity.dart';
import 'package:eschool_management/features/domain/entities/resources/resource_entity.dart';
import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';
import 'package:eschool_management/features/domain/entities/subjects/subject_weekly_hours_entity.dart';
import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';
import 'package:eschool_management/features/domain/entities/timetable/today_classes_entity.dart';

import '../../../core/error/failure.dart';
import '../entities/attendance/today_and_next_week_attendance_entity.dart';
import '../entities/events/event_entity.dart';
import '../entities/teacher_notes/teacher_note_entity.dart';
import '../entities/user/user_entity.dart';

abstract class Repository {
  /// Users
  Future<Either<Failure, UserEntity>> login(String code);
  Future<Either<Failure, String>> requestCode(
    String email,
    String role,
    int classroomId,
  );
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo();
  Future<bool> isSignInUser();
  Future<String> getCurrentTokenUser();

  ///Schools Repository
  Future<Either<Failure, List<SchoolEntity>>> getSchools();

  ///Classrooms Repository
  Future<Either<Failure, List<ClassroomEntity>>> getClassroomBySchoolId(
    int schoolId,
  );

  ///Timetable Repository
  Future<Either<Failure, List<TodayClassesEntity>>> getTodayClasses();
  Future<Either<Failure, List<TimetableByDayEntity>>> getTimetableByDay(
    String day,
  );

  ///Events Repository
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents();
  Future<Either<Failure, List<EventEntity>>> getRecentEvents();
  Future<Either<Failure, List<EventEntity>>> getTodayEvents();
  Future<Either<Failure, EventEntity>> getDetailEvent(int eventId);

  ///Exams
  Future<Either<Failure, List<ExamTodayAndNextWeekEntity>>>
  getTodayAndNextWeekExams();
  Future<Either<Failure, List<ExamsByDayEntity>>> getExamsByDay(
    DateTime examDate,
  );

  ///Homeworks
  Future<Either<Failure, List<HomeworkTodayAndNextWeekEntity>>>
  getTodayAndNextWeekHomeworks();
  Future<Either<Failure, List<HomeworkByDayEntity>>> getHomeworkByDay(
    DateTime dueDate,
  );
  Future<Either<Failure, List<HomeworkBySubjectEntity>>> getHomeworkBySubject(
    int subjectId,
  );

  ///Attendance
  Future<Either<Failure, List<TodayAndNextWeekAttendanceEntity>>>
  getTodayAndNextWeekAttendance();

  ///Subjects
  Future<Either<Failure, SubjectWeeklyHoursEntity>> getSubjectWeeklyHours(
    int subjectId,
  );

  ///Resource
  Future<Either<Failure, List<ResourceEntity>>> getResource(int subjectId);

  ///Teacher Notes
  Future<Either<Failure, List<TeacherNoteEntity>>> getTeacherNotes(
    int subjectId,
  );
}
