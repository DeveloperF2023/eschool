import 'package:equatable/equatable.dart';

class SchoolEntity extends Equatable {
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

  SchoolEntity(
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        slug,
        email,
        phone,
        address,
        logo,
        type,
        principalName,
        academicYear,
        status,
        createdAt,
        updatedAt
      ];
}
