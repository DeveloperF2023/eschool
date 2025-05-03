import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/schools/get_schools_use_case.dart';

import '../../../../domain/entities/schools/school_entity.dart';

part 'get_school_state.dart';

class GetSchoolCubit extends Cubit<GetSchoolState> {
  final FetchSchoolsUseCase getSchoolsUseCase;
  GetSchoolCubit({required this.getSchoolsUseCase}) : super(GetSchoolInitial());

  Future<void> getSchools() async {
    emit(GetSchoolLoading());
    try {
      final result = await getSchoolsUseCase.callback();
      result.fold((l) => emit(GetSchoolFailure(message: l.message)),
          (r) => emit(GetSchoolLoaded(school: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetSchoolFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetSchoolFailure(message: e.toString()));
    }
  }
}
