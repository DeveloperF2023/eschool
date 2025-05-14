import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold, fontSize: 32, color: AppColors.black),
    headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
    headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
    bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black),
    bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.black),
    titleSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: AppColors.textPrimary),
    titleMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w900,
        fontSize: 10,
        color: AppColors.greyTextColor),
    titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold, fontSize: 32, color: AppColors.textWhite),
    headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.textWhite),
    headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.textWhite),
    bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500, fontSize: 11, color: AppColors.textWhite),
    bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textWhite),
    titleSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.textWhite),
    titleMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w900, fontSize: 10, color: AppColors.textWhite),
    titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.textWhite),
  );
}
