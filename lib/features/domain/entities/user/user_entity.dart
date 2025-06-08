import 'package:equatable/equatable.dart';

import 'user_data_entity.dart';

class UserEntity extends Equatable {
  final String? token;
  final UserDataEntity? user;
  final int? studentId;
  const UserEntity({this.token, this.user, this.studentId});

  @override
  // TODO: implement props
  List<Object?> get props => [token, user, studentId];
}
