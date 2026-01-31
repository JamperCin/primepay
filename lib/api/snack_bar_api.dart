import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';

import '../app/AppTextStyles.dart';

class SnackBarApi {
  ///General SnackBar with options
  static void snackBar({
    String title = '',
    String message = '',
    IconData icon = Icons.info_outline,
    Color backgroundColor = AppColors.background,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
    bool showProgressIndicator = false,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: iconColor),
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      showProgressIndicator: showProgressIndicator,
      overlayBlur: 5,
      overlayColor: Colors.black.withOpacity(0.5),
      shouldIconPulse: true,
      barBlur: 0.3,
      titleText: Text(
        title,
        style: AppTextStyles.getStyle(AppTextStyles.descStyleBold, textColor),
      ),
      messageText: Text(
        message,
        style: AppTextStyles.getStyle(AppTextStyles.descStyleLight, textColor),
      ),
    );
  }

  static void snackBarError(String message, {String title = "Error"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  static void snackBarInfo(String message, {String title = "Info"}) {
    snackBar(
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  static void snackBarSuccess(String message, {String title = "Success"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.done,
      backgroundColor: AppColors.background,
      textColor: AppColors.primaryGreenColor,
      iconColor: AppColors.primaryGreenColor,
    );
  }
}
