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
  "Physical Education": AppAssets.sport,
};

String getSubjectSvg(String subjectName) {
  return subjectImageMap[subjectName] ?? 'assets/images/subjects/default.svg';
}

final Map<String, Color> subjectColorMap = {
  'Maths': AppColors.mathColor,
  'Physics & Chemistry': AppColors.physicsColor,
  'Biology': AppColors.biologyColor,
  'English Literature': AppColors.englishColor,
  'History': AppColors.historyColor,
  'Computer Science': AppColors.computerScienceColor.withValues(alpha: 0.6),
  'Economics': AppColors.economicColor,
  'Philosophy': AppColors.philosophyColor,
  'French': AppColors.frenchColor,
  'Spanish': AppColors.spanishColor,
  'Art': AppColors.artColor,
  'Music': AppColors.musicColor,
  "Physical Education": AppColors.physicalEducationColor,
};
Color getSubjectColor(String subjectName) {
  return subjectColorMap[subjectName] ?? Colors.black; // Fallback color
}
