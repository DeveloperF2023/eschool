part of 'get_today_classes_cubit.dart';

abstract class GetTodayClassesState extends Equatable {
  const GetTodayClassesState();

  @override
  List<Object> get exoticProps => [];
}

class GetTodayClassesInitial extends GetTodayClassesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetTodayClassesLoading extends GetTodayClassesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetTodayClassesSuccess extends GetTodayClassesState {
  final List<TodayClassesEntity> classes;

  const GetTodayClassesSuccess({
    required this.classes,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [classes];
}

class GetTodayClassesError extends GetTodayClassesState {
  final String? message;

  const GetTodayClassesError({
    this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
