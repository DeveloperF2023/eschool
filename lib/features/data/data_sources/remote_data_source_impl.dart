import 'package:dio/dio.dart';
import 'package:eschool_management/features/data/data_sources/remote_data_source.dart';
import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/schools/school_model.dart';
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
            "Content-Type": "application/json"
          },
          // Increase timeouts
          sendTimeout: const Duration(seconds: 15), // Timeout for sending data
          receiveTimeout:
              const Duration(seconds: 15), // Timeout for receiving data
          validateStatus: (status) {
            return status! < 500; // Validate status codes less than 500
          },
        ),
      );

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        await preferences.setString("token", response.data['token']);
        await preferences.setString(
            "firstName", response.data['user']['first_name']);
        await preferences.setString(
            "lastName", response.data['user']['last_name']);
        await preferences.setString("email", response.data['user']['email']);
        await preferences.setInt("userId", response.data['user']['id']);
        await preferences.setString(
            "profilePicture", response.data['user']['profile_picture']);
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login user');
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
            "Content-Type": "application/json"
          },
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          validateStatus: (status) => true,
        ),
      );
      print(
          "Sending request with: email=$email, role=$role, classroomId=$classroomId");
      print(
          "Url of request code :${EndpointsConstants.baseUrl}${EndpointsConstants.requestCode}");
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
  Future<List<SchoolModel>> getSchools() async {
    try {
      final response = await client.get(
        "${EndpointsConstants.baseUrl}${EndpointsConstants.getSchool}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Content-Type": "application/json"
          },
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
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
            "Content-Type": "application/json"
          },
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
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
}
