part of 'login_user_cubit.dart';

sealed class LoginUserState extends Equatable {
  const LoginUserState();
}

final class LoginUserInitial extends LoginUserState {
  @override
  List<Object> get props => [];
}

final class LoginUserLoading extends LoginUserState {
  @override
  List<Object> get props => [];
}

final class LoginUserLoaded extends LoginUserState {
  final UserEntity user;

  LoginUserLoaded({required this.user});
  @override
  List<Object> get props => [];
}

final class LoginUserFailure extends LoginUserState {
  final String message;

  LoginUserFailure({required this.message});
  @override
  List<Object> get props => [message];
}
