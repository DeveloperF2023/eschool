import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  int? id;
  String? title;
  String? description;
  String? eventDate;
  String? startTime;
  String? endTime;
  String? location;
  String? type;
  int? classroomId;
  String? createdAt;
  String? updatedAt;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
