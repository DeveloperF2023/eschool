import 'package:eschool_management/features/domain/entities/subjects/subject_weekly_hours_entity.dart';

class SubjectWeeklyHoursModel extends SubjectWeeklyHoursEntity {
  final int? hoursPerWeek;

  const SubjectWeeklyHoursModel({this.hoursPerWeek})
    : super(hoursPerWeek: hoursPerWeek);

  factory SubjectWeeklyHoursModel.fromJson(Map<String, dynamic> json) {
    return SubjectWeeklyHoursModel(hoursPerWeek: json['hours_per_week']);
  }
}
