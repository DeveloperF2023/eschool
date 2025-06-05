part of 'get_school_cubit.dart';

sealed class GetSchoolState extends Equatable {
  const GetSchoolState();
}

final class GetSchoolInitial extends GetSchoolState {
  @override
  List<Object> get props => [];
}

final class GetSchoolLoading extends GetSchoolState {
  @override
  List<Object> get props => [];
}

final class GetSchoolLoaded extends GetSchoolState {
  final List<SchoolEntity> school;

  GetSchoolLoaded({required this.school});
  @override
  List<Object> get props => [school];
}

final class GetSchoolFailure extends GetSchoolState {
  final String message;

  GetSchoolFailure({required this.message});
  @override
  List<Object> get props => [message];
}
