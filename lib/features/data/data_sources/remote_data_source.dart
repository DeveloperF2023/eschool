import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/exams/exams_today_next_week_model.dart';
import 'package:eschool_management/features/data/models/timetable/today_classes_model.dart';
import 'package:eschool_management/features/data/models/user/user_model.dart';

import '../models/events/event_model.dart';
import '../models/schools/school_model.dart';

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

  ///Events
  Future<List<EventModel>> getEvents();

  ///Exams
  Future<List<ExamTodayNextWeekModel>> getTodayAndNextWeekExams();
}
