import 'package:dartz/dartz.dart';
import 'package:eschool_management/features/domain/entities/teacher_notes/teacher_note_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchTeacherNoteUseCase {
  final Repository repository;

  FetchTeacherNoteUseCase({required this.repository});

  Future<Either<Failure, List<TeacherNoteEntity>>> callback(int subjectId) {
    return repository.getTeacherNotes(subjectId);
  }
}
