import 'package:dio/dio.dart';
import 'package:eschool_management/features/data/data_sources/remote_data_source.dart';
import 'package:eschool_management/features/data/models/attendance/today_and_next_week_attendance_model.dart';
import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/events/event_model.dart';
import 'package:eschool_management/features/data/models/exams/exams_by_day_model.dart';
import 'package:eschool_management/features/data/models/exams/exams_today_next_week_model.dart';
import 'package:eschool_management/features/data/models/homeworks/homework_by_day_model.dart';
import 'package:eschool_management/features/data/models/homeworks/homework_by_subject_model.dart';
import 'package:eschool_management/features/data/models/homeworks/homework_today_and_next_week_model.dart';
import 'package:eschool_management/features/data/models/resources/resources_model.dart';
import 'package:eschool_management/features/data/models/schools/school_model.dart';
import 'package:eschool_management/features/data/models/subjects/subject_weekly_hour_model.dart';
import 'package:eschool_management/features/data/models/timetable/timetable_by_day_model.dart';
import 'package:eschool_management/features/data/models/timetable/today_classes_model.dart';
import 'package:eschool_management/features/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/api/endpoints_constants.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> loginUser(String code) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      final response = await client.post(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.login}",
        data: {"code": code},
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          // Increase timeouts
          sendTimeout: const Duration(seconds: 50), // Timeout for sending data
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        await preferences.setString("token", response.data['token']);
        await preferences.setString("email", response.data['user']['email']);
        await preferences.setString("name", response.data['user']['name']);
        await preferences.setString("role", response.data['user']['role']);
        await preferences.setInt("userId", response.data['user']['id']);
        await preferences.setInt(
          "classroomId",
          response.data['user']['classroom_id'],
        );
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 403) {
        final errorMessage = response.data['error'] ?? 'Failed to log in';
        throw Exception(errorMessage); // Pass exact backend message
      } else {
        throw Exception('Failed to log in');
      }
    } on DioException catch (e) {
      // Handle DioError for timeout or network issues
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      // General error handling
      print("Error: $e");
      throw Exception("Login failed");
    }
  }

  @override
  Future<String> requestCode(String email, String role, int classroomId) async {
    try {
      final response = await client.post(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.requestCode}",
        data: {"email": email, "role": role, "classroom_id": classroomId},
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) => true,
        ),
      );
      print(
        "Sending request with: email=$email, role=$role, classroomId=$classroomId",
      );
      print(
        "Url of request code :${EndpointsConstants.baseUrl}${EndpointsConstants.requestCode}",
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<String> getCurrentTokenUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print("token $token");
    return token;
  }

  @override
  Future<bool> isSignInUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print("token $token");
    if (token != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<SchoolModel>> getSchools() async {
    try {
      final response = await client.get(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.getSchool}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return SchoolModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<ClassroomModel>> getClassroomBySchoolId(int schoolId) async {
    try {
      final response = await client.get(
        "${EndpointsConstants.baseUrl}school/$schoolId/classes",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return ClassroomModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final userId = preferences.getInt("userId");
      final response = await client.get(
        "${EndpointsConstants.baseUrl}user-info/$userId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<TodayClassesModel>> getTodayClasses() async {
    try {
      final response = await client.get(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.getTodayClasses}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return TodayClassesModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<EventModel>> getEvents() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final userId = preferences.getInt("userId");
      final response = await client.get(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.getEvents}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return EventModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<ExamTodayNextWeekModel>> getTodayAndNextWeekExams() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}exams/$classroomId/today-and-next-week",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return ExamTodayNextWeekModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<HomeworkTodayAndNextWeekModel>>
  getTodayAndNextWeekHomeworks() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}homeworks/$classroomId/today-and-next-week",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return HomeworkTodayAndNextWeekModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<TodayAndNextWeekAttendanceModel>>
  getTodayAndNextWeekAttendance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      final userId = preferences.getInt("userId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}attendance/user/$userId/classroom/$classroomId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return TodayAndNextWeekAttendanceModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<TimetableByDayModel>> getTimetableByDay(String day) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}timetables/day?day=$day&classroom_id=$classroomId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return TimetableByDayModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<HomeworksByDayModel>> getHomeworkByDay(DateTime dueDate) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}homeworks/$classroomId/by-date/$dueDate",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return HomeworksByDayModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<ExamsByDayModel>> getExamsByDay(DateTime examDate) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}exams/$classroomId/by-date?date=$examDate",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return ExamsByDayModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<HomeworkBySubjectModel>> getHomeworkBySubject(
    int subjectId,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}subjects/$subjectId/$classroomId/homeworks",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return HomeworkBySubjectModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<SubjectWeeklyHoursModel> getSubjectWeeklyHours(int subjectId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}subjects/$subjectId/$classroomId/weekly-hours",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return SubjectWeeklyHoursModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }

  @override
  Future<List<ResourceModel>> getResourcesBySubject(int subjectId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final classroomId = preferences.getInt("classroomId");
      print('Classroom ID: $classroomId');
      final response = await client.get(
        "${EndpointsConstants.baseUrl}resources/subject/$subjectId/classroom/$classroomId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json",
          },
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        return ResourceModel.fromJsonList(response.data);
      } else {
        throw Exception('Failed to login user');
      }
    } on DioException catch (e) {
      print("DioError: ${e.message}");
      throw Exception("Connection Timeout or Network Error");
    } catch (e) {
      print("Error: $e");
      throw Exception("Request Code failed");
    }
  }
}
