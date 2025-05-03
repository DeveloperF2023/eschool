import 'package:eschool_management/features/data/models/classroom/classroom_model.dart';
import 'package:eschool_management/features/data/models/user/user_model.dart';

import '../models/schools/school_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> loginUser(String code);
  Future<String> requestCode(String email, String role, int classroomId);

  ///Schools
  Future<List<SchoolModel>> getSchools();

  ///Classrooms
  Future<List<ClassroomModel>> getClassroomBySchoolId(int schoolId);
}
