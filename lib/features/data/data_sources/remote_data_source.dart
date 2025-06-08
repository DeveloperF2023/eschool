import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/exams/exams_by_day_model.dart';
import 'package:eschool_management/features/data/models/exams/exams_today_next_week_model.dart';
import 'package:eschool_management/features/data/models/homeworks/homework_by_day_model.dart';
import 'package:eschool_management/features/data/models/homeworks/homework_today_and_next_week_model.dart';
import 'package:eschool_management/features/data/models/resources/resources_model.dart';
import 'package:eschool_management/features/data/models/subjects/subject_weekly_hour_model.dart';
import 'package:eschool_management/features/data/models/timetable/timetable_by_day_model.dart';
import 'package:eschool_management/features/data/models/timetable/today_classes_model.dart';
import 'package:eschool_management/features/data/models/user/user_model.dart';

import '../models/attendance/today_and_next_week_attendance_model.dart';
import '../models/events/event_model.dart';
import '../models/homeworks/homework_by_subject_model.dart';
import '../models/schools/school_model.dart';
import '../models/teacher_notes/teacher_notes_model.dart';

abstract class RemoteDataSource {
  ///Users
  Future<UserModel> loginUser(String code);
  Future<String> requestCode(String email, String role, int classroomId);
  Future<Map<String, dynamic>> getUserInfo();
  Future<bool> isSignInUser();
  Future<String> getCurrentTokenUser();

  ///Schools
  Future<List<SchoolModel>> getSchools();

  ///Classrooms
  Future<List<ClassroomModel>> getClassroomBySchoolId(int schoolId);

  ///Timetable
  Future<List<TodayClassesModel>> getTodayClasses();
  Future<List<TimetableByDayModel>> getTimetableByDay(String day);

  ///Events
  Future<List<EventModel>> getUpcomingEvents();
  Future<List<EventModel>> getRecentEvents();
  Future<List<EventModel>> getTodayEvents();
  Future<EventModel> getEventsById(int eventId);

  ///Exams
  Future<List<ExamTodayNextWeekModel>> getTodayAndNextWeekExams();
  Future<List<ExamsByDayModel>> getExamsByDay(DateTime examDate);

  ///Homeworks
  Future<List<HomeworkTodayAndNextWeekModel>> getTodayAndNextWeekHomeworks();
  Future<List<HomeworksByDayModel>> getHomeworkByDay(DateTime dueDate);
  Future<List<HomeworkBySubjectModel>> getHomeworkBySubject(int subjectId);

  ///Attendance
  Future<List<TodayAndNextWeekAttendanceModel>> getTodayAndNextWeekAttendance();

  /// Subjects
  Future<SubjectWeeklyHoursModel> getSubjectWeeklyHours(int subjectId);

  /// Resources
  Future<List<ResourceModel>> getResourcesBySubject(int subjectId);

  /// Teacher Notes
  Future<List<TeacherNoteModel>> getTeacherNotesBySubject(int subjectId);
}
