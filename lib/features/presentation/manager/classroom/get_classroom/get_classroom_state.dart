part of 'get_classroom_cubit.dart';

sealed class GetClassroomState extends Equatable {
  const GetClassroomState();
}

final class GetClassroomInitial extends GetClassroomState {
  @override
  List<Object> get props => [];
}
final class GetClassroomLoading extends GetClassroomState {
  @override
  List<Object> get props => [];
}

final class GetClassroomLoaded extends GetClassroomState {
  final List<ClassroomEntity> classrooms;

  GetClassroomLoaded({required this.classrooms});
  @override
  List<Object> get props => [classrooms];
}

final class GetClassroomFailure extends GetClassroomState {
  final String message;

  GetClassroomFailure({required this.message});
  @override
  List<Object> get props => [message];
}