import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/classrooms/classroom_entity.dart';
import 'package:eschool_management/features/domain/use_cases/classroom/fetch_classroom_by_school_id_use_case.dart';

part 'get_classroom_state.dart';

class GetClassroomCubit extends Cubit<GetClassroomState> {
  final FetchClassroomBySchoolIdUseCase fetchClassroomBySchoolIdUseCase;
  GetClassroomCubit({required this.fetchClassroomBySchoolIdUseCase})
      : super(GetClassroomInitial());

  Future<void> getClassroomBySchoolId({required int schoolId}) async {
    emit(GetClassroomLoading());
    try {
      final result = await fetchClassroomBySchoolIdUseCase.callback(schoolId);
      result.fold((l) => emit(GetClassroomFailure(message: l.message)),
          (r) => emit(GetClassroomLoaded(classrooms: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetClassroomFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetClassroomFailure(message: e.toString()));
    }
  }
}
