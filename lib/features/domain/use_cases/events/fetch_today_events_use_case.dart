import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTodayEventsUseCase {
  final Repository repository;

  FetchTodayEventsUseCase({required this.repository});

  Future<Either<Failure, List<EventEntity>>> callback() {
    return repository.getTodayEvents();
  }
}
