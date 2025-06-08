import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class TextFormFieldThemeApp {
  TextFormFieldThemeApp._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      color: AppColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
        fontSize: AppSizes.iconXs,
        color: AppColors.black,
        fontWeight: FontWeight.w500),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: AppColors.black.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: AppSizes.fontSizeMd, color: AppColors.white),
    hintStyle: const TextStyle().copyWith(
        fontSize: AppSizes.iconXs,
        color: AppColors.white,
        fontWeight: FontWeight.w400),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: AppColors.white.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.radiusTextFieldMedium),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );
}
