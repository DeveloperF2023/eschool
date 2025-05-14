import 'package:eschool_management/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

final Map<String, String> subjectImageMap = {
  'Maths': AppAssets.math,
  'Physics & Chemistry': AppAssets.physics,
  'Biology': AppAssets.biology,
  'English Literature': AppAssets.english,
  'History': AppAssets.geography,
  'Computer Science': AppAssets.computerScience,
  'Economics': AppAssets.economic,
  'Philosophy': AppAssets.philosophy,
  'French': AppAssets.french,
  'Spanish': AppAssets.spanish,
  'Art': AppAssets.art,
  'Music': AppAssets.music,
  "Physical Education": AppAssets.sport
};

String getSubjectSvg(String subjectName) {
  return subjectImageMap[subjectName] ?? 'assets/images/subjects/default.svg';
}

final Map<String, Color> subjectColorMap = {
  'Maths': AppColors.mathColor.withValues(alpha: 0.5),
  'Physics & Chemistry': AppColors.physicsColor.withValues(alpha: 0.5),
  'Biology': AppColors.biologyColor.withValues(alpha: 0.5),
  'English Literature': AppColors.englishColor.withValues(alpha: 0.5),
  'History': AppColors.historyColor,
  'Computer Science': AppColors.computerScienceColor.withValues(alpha: 0.6),
  'Economics': AppColors.economicColor.withValues(alpha: 0.5),
  'Philosophy': AppColors.philosophyColor,
  'French': AppColors.frenchColor.withValues(alpha: 0.5),
  'Spanish': AppColors.spanishColor.withValues(alpha: 0.5),
  'Art': AppColors.artColor.withValues(alpha: 0.5),
  'Music': AppColors.musicColor.withValues(alpha: 0.5),
  "Physical Education": AppColors.physicalEducationColor.withValues(alpha: 0.5),
};
Color getSubjectColor(String subjectName) {
  return subjectColorMap[subjectName] ?? Colors.black; // Fallback color
}
