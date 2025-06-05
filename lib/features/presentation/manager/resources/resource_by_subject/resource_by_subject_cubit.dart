import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/resources/resource_entity.dart';
import 'package:eschool_management/features/domain/use_cases/resources/fetch_resources_by_subject_use_case.dart';

part 'resource_by_subject_state.dart';

class ResourceBySubjectCubit extends Cubit<ResourceBySubjectState> {
  final FetchResourcesBySubjectUseCase fetchResourcesBySubjectUseCase;
  ResourceBySubjectCubit({required this.fetchResourcesBySubjectUseCase})
    : super(ResourceBySubjectInitial());

  Future<void> getResourcesBySubject({required int subjectId}) async {
    emit(ResourceBySubjectLoading());
    try {
      final result = await fetchResourcesBySubjectUseCase.callback(subjectId);
      result.fold(
        (l) => emit(ResourceBySubjectFailure(message: l.message)),
        (r) => emit(ResourceBySubjectLoaded(resources: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(ResourceBySubjectFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(ResourceBySubjectFailure(message: e.toString()));
    }
  }
}
