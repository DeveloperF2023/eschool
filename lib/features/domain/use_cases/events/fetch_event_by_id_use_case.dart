import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchEventsByIdUseCase {
  final Repository repository;

  FetchEventsByIdUseCase({required this.repository});

  Future<Either<Failure, EventEntity>> callback(int eventId) {
    return repository.getDetailEvent(eventId);
  }
}
