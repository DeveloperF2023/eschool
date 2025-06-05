part of 'resource_by_subject_cubit.dart';

sealed class ResourceBySubjectState extends Equatable {
  const ResourceBySubjectState();
}

final class ResourceBySubjectInitial extends ResourceBySubjectState {
  @override
  List<Object> get props => [];
}

final class ResourceBySubjectLoading extends ResourceBySubjectState {
  @override
  List<Object> get props => [];
}

final class ResourceBySubjectLoaded extends ResourceBySubjectState {
  final List<ResourceEntity> resources;

  const ResourceBySubjectLoaded({required this.resources});
  @override
  List<Object> get props => [resources];
}

final class ResourceBySubjectFailure extends ResourceBySubjectState {
  final String message;

  ResourceBySubjectFailure({required this.message});
  @override
  List<Object> get props => [message];
}
