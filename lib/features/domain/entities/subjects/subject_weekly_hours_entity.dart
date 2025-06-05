import 'package:equatable/equatable.dart';

class SubjectWeeklyHoursEntity extends Equatable {
  final int? hoursPerWeek;

  const SubjectWeeklyHoursEntity({required this.hoursPerWeek});

  @override
  // TODO: implement props
  List<Object?> get props => [hoursPerWeek];
}
