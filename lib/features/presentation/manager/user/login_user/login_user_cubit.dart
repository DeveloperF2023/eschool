import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eschool_management/features/domain/entities/user/user_entity.dart';
import 'package:eschool_management/features/domain/use_cases/user/login_user_use_case.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  final LoginUserUseCase loginUserUseCase;

  LoginUserCubit({required this.loginUserUseCase}) : super(LoginUserInitial());

  Future<void> loginUser({required String code}) async {
    emit(LoginUserLoading());
    try {
      final result = await loginUserUseCase.callback(code);
      result.fold((l) => emit(LoginUserFailure(message: l.message)),
          (r) => emit(LoginUserLoaded(user: r)));
      print("This is result $result");
    } on SocketException catch (e) {
      print("this is error $e");
      emit(LoginUserFailure(message: _extractErrorMessage(e)));
    } catch (e) {
      print("this is error $e");
      emit(LoginUserFailure(message: _extractErrorMessage(e)));
    }
  }
}

String _extractErrorMessage(Object error) {
  if (error is Exception) {
    final msg = error.toString();
    return msg.replaceFirst('Exception:', '').trim();
  }
  return 'Unexpected error';
}
