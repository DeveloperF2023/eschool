import 'package:equatable/equatable.dart';

import 'user_data_entity.dart';

class UserEntity extends Equatable {
  final String? token;
  final UserDataEntity? user;

  const UserEntity({this.token, this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [token, user];
}
