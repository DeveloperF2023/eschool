import 'package:equatable/equatable.dart';

class ResourceEntity extends Equatable {
  final int? resourceId;
  final int? subjectId;
  final String? type;
  final String? url;
  final String? title;
  final String? description;

  const ResourceEntity({
    this.resourceId,
    this.subjectId,
    this.type,
    this.url,
    this.title,
    this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    resourceId,
    subjectId,
    type,
    url,
    title,
    description,
  ];
}
