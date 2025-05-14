import 'package:eschool_management/features/domain/entities/events/event_entity.dart';

class EventModel extends EventEntity {
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

  EventModel(
      {this.id,
      this.title,
      this.description,
      this.eventDate,
      this.startTime,
      this.endTime,
      this.location,
      this.type,
      this.classroomId,
      this.createdAt,
      this.updatedAt});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      eventDate: json['event_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      location: json['location'],
      type: json['type'],
      classroomId: json['classroom_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  static List<EventModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => EventModel.fromJson(json)).toList();
  }
}
