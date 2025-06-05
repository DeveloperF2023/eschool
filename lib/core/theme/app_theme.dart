import 'package:eschool_management/core/theme/text_form_field_theme_app.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_theme.dart';
import 'check_box_theme_app.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      inputDecorationTheme: TextFormFieldThemeApp.lightInputDecorationTheme,
      checkboxTheme: CheckBoxThemeApp.lightCheckBoxTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: AppColors.dark,
      textTheme: AppTextTheme.darkTextTheme,
      inputDecorationTheme: TextFormFieldThemeApp.darkInputDecorationTheme,
      checkboxTheme: CheckBoxThemeApp.darkCheckBoxTheme);
}
