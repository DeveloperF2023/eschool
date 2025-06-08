import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/use_cases/user/fetch_user_info_use_case.dart';

part 'personal_user_info_state.dart';

class PersonalUserInfoCubit extends Cubit<PersonalUserInfoState> {
  final FetchUserInfoUseCase fetchUserInfoUseCase;
  PersonalUserInfoCubit({required this.fetchUserInfoUseCase})
      : super(PersonalUserInfoInitial());

  Future<void> fetchUserInfo() async {
    emit(PersonalUserInfoLoading());
    try {
      final result = await fetchUserInfoUseCase.callback();
      result.fold((l) => emit(PersonalUserInfoFailure(message: l.message)),
          (r) => emit(PersonalUserInfoLoaded(userInfo: r)));
      print("This is result $result");
    } on SocketException catch (e) {
      print("this is error $e");
      emit(PersonalUserInfoFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(PersonalUserInfoFailure(message: e.toString()));
    }
  }
}
