import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

final Map<String, Color> attendanceColorMap = {
  'present': AppColors.presentColor.withValues(alpha: 0.5),
  'absent': AppColors.absentColor.withValues(alpha: 0.5),
  'late': AppColors.lateColor.withValues(alpha: 0.5),
  'excused': AppColors.excusedColor.withValues(alpha: 0.5),
};

Color getAttendanceStatusColor(String subjectName) {
  return attendanceColorMap[subjectName] ?? Colors.black; // Fallback color
}
