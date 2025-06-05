import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchUserInfoUseCase {
  final Repository repository;

  FetchUserInfoUseCase({required this.repository});

  Future<Either<Failure, Map<String, dynamic>>> callback() {
    return repository.getUserInfo();
  }
}
