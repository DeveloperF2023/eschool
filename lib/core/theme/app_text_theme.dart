import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold, fontSize: 32, color: AppColors.black),
    headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
    headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
    bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black),
    bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.black),
    titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: AppColors.textPrimary),
    titleMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w900,
        fontSize: 10,
        color: AppColors.greyTextColor),
    titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold, fontSize: 32, color: AppColors.textWhite),
    headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.textWhite),
    headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.textWhite),
    bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500, fontSize: 11, color: AppColors.textWhite),
    bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textWhite),
    titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.textWhite),
    titleMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w900, fontSize: 10, color: AppColors.textWhite),
    titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.textWhite),
  );
}
