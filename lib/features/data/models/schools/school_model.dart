import 'package:eschool_management/features/domain/entities/schools/school_entity.dart';

class SchoolModel extends SchoolEntity {
  final int? id;
  final String? name;
  final String? slug;
  final String? email;
  final String? phone;
  final String? address;
  final String? logo;
  final String? type;
  final String? principalName;
  final String? academicYear;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  SchoolModel(
      {this.id,
      this.name,
      this.slug,
      this.email,
      this.phone,
      this.address,
      this.logo,
      this.type,
      this.principalName,
      this.academicYear,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      logo: json['logo'],
      type: json['type'],
      principalName: json['principal_name'],
      academicYear: json['academic_year'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  static List<SchoolModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SchoolModel.fromJson(json)).toList();
  }
}
