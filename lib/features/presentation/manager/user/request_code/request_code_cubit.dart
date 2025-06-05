import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/use_cases/user/request_code_use_case.dart';

part 'request_code_state.dart';

class RequestCodeCubit extends Cubit<RequestCodeState> {
  final RequestCodeUseCase requestCodeUseCase;
  RequestCodeCubit({required this.requestCodeUseCase})
      : super(RequestCodeInitial());

  Future<void> requestCode(
      {required String email,
      required String role,
      required int classroomId}) async {
    emit(RequestCodeLoading());
    try {
      final result =
          await requestCodeUseCase.callback(email, role, classroomId);
      result.fold((l) => emit(RequestCodeFailure(errorMessage: l.message)),
          (r) => emit(RequestCodeLoaded(message: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(RequestCodeFailure(errorMessage: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(RequestCodeFailure(errorMessage: e.toString()));
    }
  }
}
