import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import '../../constants/app_colors.dart';

final Map<String, Color> attendanceColorMap = {
  'present': AppColors.presentColor,
  'absent': AppColors.absentColor,
  'late': AppColors.lateColor,
  'excused': AppColors.excusedColor,
};

Color getAttendanceStatusColor(String attendanceStatus) {
  return attendanceColorMap[attendanceStatus] ?? Colors.black; // Fallback color
}

final Map<String, dynamic> attendanceIconMap = {
  'present': MaterialSymbols.block,
  'absent': MaterialSymbols.block,
  'late': Ic.sharp_schedule,
  'excused': Ic.baseline_sticky_note_2,
};
String getAttendanceStatusIcon(String attendanceStatus) {
  return attendanceIconMap[attendanceStatus]; // Fallback color
}
