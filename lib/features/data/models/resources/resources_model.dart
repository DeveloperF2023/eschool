import 'package:eschool_management/features/domain/entities/resources/resource_entity.dart';

class ResourceModel extends ResourceEntity {
  int? resourceId;
  int? subjectId;
  String? type;
  String? url;
  String? title;
  String? description;

  ResourceModel({
    this.resourceId,
    this.subjectId,
    this.type,
    this.url,
    this.title,
    this.description,
  });

  ResourceModel.fromJson(Map<String, dynamic> json) {
    resourceId = json['resource_id'];
    subjectId = json['subject_id'];
    type = json['type'];
    url = json['url'];
    title = json['title'];
    description = json['description'];
  }

  static List<ResourceModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ResourceModel.fromJson(json)).toList();
  }
}
