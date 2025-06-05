import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/homeworks/homework_by_subject_entity.dart';
import '../../../../domain/use_cases/homeworks/fetch_homework_by_subject_use_case.dart';

part 'homework_by_subject_state.dart';

class HomeworkBySubjectCubit extends Cubit<HomeworkBySubjectState> {
  final FetchHomeworkBySubjectUseCase fetchHomeworkBySubjectUseCase;
  HomeworkBySubjectCubit({required this.fetchHomeworkBySubjectUseCase})
    : super(HomeworkBySubjectInitial());
  Future<void> getHomeworkBySubject({required int subjectId}) async {
    emit(HomeworkBySubjectLoading());
    try {
      final result = await fetchHomeworkBySubjectUseCase.callback(subjectId);
      result.fold(
        (l) => emit(HomeworkBySubjectFailure(message: l.message)),
        (r) => emit(HomeworkBySubjectLoaded(homeworks: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(HomeworkBySubjectFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(HomeworkBySubjectFailure(message: e.toString()));
    }
  }
}
