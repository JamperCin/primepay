import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

import 'AppColors.dart';


ThemeData lightMode = ThemeData(
  platform: TargetPlatform.iOS,
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle,
    labelMedium: labelMediumTextLightModeStyle,
    labelLarge: labelLargeTextLightModeStyle,
    //
    bodySmall: bodySmallTextLightModeStyle,
    bodyLarge: bodyLargeTextLightModeStyle,
    bodyMedium: bodyMediumTextLightModeStyle,

    displayLarge: displayLargeTextLightModeStyle,
    displayMedium: displayMediumTextLightModeStyle,
    displaySmall: displaySmallTextLightModeStyle,
    //
    headlineLarge: headingLargeTextLightModeStyle,
    headlineMedium: headingMediumTextLightModeStyle,
    headlineSmall: headingSmallTextLightModeStyle,
    //
    titleLarge: titleLargeTextLightModeStyle,
    titleMedium: titleMediumTextLightModeStyle,
    titleSmall: titleSmallTextLightModeStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: AppColors.primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: AppColors.disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: Colors.transparent,
      textStyle: normalButtonLightModeStyle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(18),
          right: Radius.circular(18),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,

    ///primary colors and inverted color
    primary: AppColors.primaryGreenColor,
    inversePrimary: AppColors.disabledGreenColor,
    //
    onPrimary: AppColors.secondaryGreenColor,
    primaryContainer: AppColors.merGreen,
    primaryFixedDim: AppColors.merSky,
    primaryFixed: AppColors.merBlue,

    ///Secondary colors
    secondary: AppColors.merGreen,
    onSecondary: AppColors.grey,
    secondaryContainer: AppColors.nearlyBlack,

    ///Tertiary colors
    tertiary: AppColors.white,

    ///Error
    error: AppColors.red,
    onError: AppColors.redDark,

    ///Surface
    surface: AppColors.white,
    onSurface: AppColors.nearlyWhite,
    surfaceBright: AppColors.nearlyWhite,

    tertiaryContainer: AppColors.lightOrange,

    ///Inverse surface
    inverseSurface: AppColors.lightDark,

    ///Green color
    outline: AppColors.deactivatedText,
    shadow: AppColors.lightGreen,
    outlineVariant: AppColors.deactivatedText,
    surfaceDim: AppColors.deactivatedText,
  ),
  appBarTheme: AppBarTheme(
    elevation: 5, // Set AppBar elevation
    backgroundColor: Colors.white, // Background color
    iconTheme: const IconThemeData(color: Colors.black), // Leading icon color
    titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 16.dp()), // Title color
  ),
);
