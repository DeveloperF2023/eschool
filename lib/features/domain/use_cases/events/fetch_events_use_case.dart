import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchEventsUseCase {
  final Repository repository;

  FetchEventsUseCase({required this.repository});

  Future<Either<Failure, List<EventEntity>>> callback() {
    return repository.getEvents();
  }
}
