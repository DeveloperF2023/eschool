import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/use_cases/user/get_current_token_use_case.dart';
import '../../../../domain/use_cases/user/is_sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentTokenUseCase getCurrentTokenUserUseCase;
  final IsSignInUserUseCase isSignInUserUseCase;
  AuthCubit(
      {required this.getCurrentTokenUserUseCase,
      required this.isSignInUserUseCase})
      : super(AuthInitial());
  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUserUseCase.callback();
      if (isSignIn == true) {
        final token = await getCurrentTokenUserUseCase.callback();
        print("this is token $token");
        emit(Authenticated(token: token));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final token = await getCurrentTokenUserUseCase.callback();
      print("this is token $token");
      emit(Authenticated(token: token));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
