import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/timetable/today_classes_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTodayClassesUseCase {
  final Repository repository;

  FetchTodayClassesUseCase({required this.repository});

  Future<Either<Failure, List<TodayClassesEntity>>> callback() {
    return repository.getTodayClasses();
  }
}
