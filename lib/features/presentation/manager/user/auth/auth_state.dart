part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String token;

  const Authenticated({required this.token});

  @override
  List<Object> get props => [token];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
