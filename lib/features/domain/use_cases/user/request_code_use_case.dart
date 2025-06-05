import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class RequestCodeUseCase {
  final Repository repository;

  RequestCodeUseCase({required this.repository});

  Future<Either<Failure, String>> callback(
      String email, String role, int classroomId) {
    return repository.requestCode(email, role, classroomId);
  }
}
