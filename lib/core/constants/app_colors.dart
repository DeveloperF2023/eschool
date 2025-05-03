import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xff6355FC);
  static const Color secondaryColor = Color(0xffB2A5FF);
  static const Color grayColor = Color(0xffF1F2F4);
  static const Color whiteSmoke = Color(0xfff7f8f3);
  static const Color greyTextColor = Color(0xffAAA7AD);
  static const Color greyProduct = Color(0xffF4F4F4);
  static const Color backgroundColorSplash = Color(0xff021526);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color(0xff777777);

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color textFieldFillColor = Color(0xFFC7C7C7);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = AppColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  //Gradient Color
  static Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xff22177A),
      Color(0xff605EA1),
      Color(0xff8EA3A6),
      Color(0xffE6E9AF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
