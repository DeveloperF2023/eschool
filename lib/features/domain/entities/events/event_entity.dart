import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? eventDate;
  final String? startTime;
  final String? endTime;
  final String? location;
  final String? type;
  final String? eventPicture;
  final int? classroomId;
  final String? createdAt;
  final String? updatedAt;

  EventEntity({
    this.id,
    this.title,
    this.description,
    this.eventDate,
    this.startTime,
    this.endTime,
    this.location,
    this.type,
    this.eventPicture,
    this.classroomId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
