part of 'personal_user_info_cubit.dart';

sealed class PersonalUserInfoState extends Equatable {
  const PersonalUserInfoState();
}

final class PersonalUserInfoInitial extends PersonalUserInfoState {
  @override
  List<Object> get props => [];
}

final class PersonalUserInfoLoading extends PersonalUserInfoState {
  @override
  List<Object> get props => [];
}

final class PersonalUserInfoLoaded extends PersonalUserInfoState {
  final Map<String, dynamic> userInfo;

  PersonalUserInfoLoaded({required this.userInfo});
  @override
  List<Object> get props => [userInfo];
}

final class PersonalUserInfoFailure extends PersonalUserInfoState {
  final String message;

  PersonalUserInfoFailure({required this.message});
  @override
  List<Object> get props => [message];
}
