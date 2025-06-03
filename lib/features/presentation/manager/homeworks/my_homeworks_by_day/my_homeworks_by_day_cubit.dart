import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/homeworks/homework_by_day_entity.dart';
import 'package:eschool_management/features/domain/use_cases/homeworks/fetch_homeworks_by_day_use_case.dart';

part 'my_homeworks_by_day_state.dart';

class MyHomeworksByDayCubit extends Cubit<MyHomeworksByDayState> {
  final FetchHomeworkByDayUseCase fetchHomeworkByDayUseCase;
  MyHomeworksByDayCubit({required this.fetchHomeworkByDayUseCase})
    : super(MyHomeworksByDayInitial());

  Future<void> getHomeworkByDay({required DateTime dueDate}) async {
    emit(MyHomeworksByDayLoading());
    try {
      final result = await fetchHomeworkByDayUseCase.callback(dueDate);
      result.fold(
        (l) => emit(MyHomeworksByDayFailure(message: l.message)),
        (r) => emit(MyHomeworksByDayLoaded(homeworks: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(MyHomeworksByDayFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(MyHomeworksByDayFailure(message: e.toString()));
    }
  }
}
