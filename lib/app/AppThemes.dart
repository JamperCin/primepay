import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

import 'AppColors.dart';
import 'AppStrings.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primaryGreenColor,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.secondaryGreenColor));

  static ThemeData darkTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primaryGreenColor);

  static TextTheme textTheme = TextTheme(
    headlineMedium: AppTextStyles.display1,
    headlineSmall: AppTextStyles.headline,
    titleLarge: AppTextStyles.title,
    titleSmall: AppTextStyles.subtitle,
    bodyMedium: AppTextStyles.body2,
    bodyLarge: AppTextStyles.body1,
    bodySmall: AppTextStyles.caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: AppColors.darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: AppColors.darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: AppColors.darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: AppColors.darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppStrings.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: AppColors.lightText, // was lightText
  );
}
