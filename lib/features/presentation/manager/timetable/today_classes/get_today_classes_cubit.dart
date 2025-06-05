import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/use_cases/timetable/fetch_today_classes_use_case.dart';

import '../../../../domain/entities/timetable/today_classes_entity.dart';

part 'get_today_classes_state.dart';

class GetTodayClassesCubit extends Cubit<GetTodayClassesState> {
  final FetchTodayClassesUseCase fetchTodayClassesUseCase;
  GetTodayClassesCubit({required this.fetchTodayClassesUseCase})
      : super(GetTodayClassesInitial());

  Future<void> getTodayClasses() async {
    emit(GetTodayClassesLoading());
    try {
      final result = await fetchTodayClassesUseCase.callback();
      result.fold((l) => emit(GetTodayClassesError(message: l.message)),
          (r) => emit(GetTodayClassesSuccess(classes: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetTodayClassesError(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetTodayClassesError(message: e.toString()));
    }
  }
}
