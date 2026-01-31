import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String header;
  final String imageAsset;
  final String message;
  final String buttonText;
  final Widget? child;
  final Widget? messageWidget;
  final Function? onDoneClick;

  SuccessScreen({
    this.header = "SUCCESS !!!",
    this.title = "Payment transaction processed.",
    this.message =
        "Payment has been accepted. Please check your handset to complete payment.",
    this.child,
    this.buttonText = "Done",
    this.imageAsset = "assets/images/success_image.jpg",
    this.onDoneClick,
    this.messageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppDimens.dimen32),
          children: [
            SizedBox(
              height: AppDimens.dimen70,
            ),
            child ??
                Image.asset(
                  imageAsset,
                  height: AppDimens.dimen200,
                ),
            SizedBox(
              height: AppDimens.dimen20,
            ),
            Text(
              header,
              textAlign: TextAlign.center,
              style: AppTextStyles.getStyle(
                  AppTextStyles.h1StyleBold, AppColors.primaryGreenColor),
            ),
            SizedBox(
              height: AppDimens.dimen10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.getStyle(
                  AppTextStyles.descStyleLight, AppColors.darkText),
            ),
            SizedBox(
              height: AppDimens.dimen40,
            ),
            messageWidget ??
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getStyle(
                      AppTextStyles.descStyleUltraLight, AppColors.black),
                ),
            SizedBox(
              height: AppDimens.dimen40,
            ),
            SizedBox(
              height: AppDimens.dimen40,
            ),
            SizedBox(
              width: AppDimens.dimen170,
              height: AppDimens.dimen45,
              child: OutLinedButton(
                selectedColor: AppColors.red,
                outlineColor: AppColors.primaryGreenColor,
                appTextStyle: AppTextStyles.descStyleBold,
                filledColor: AppColors.primaryGreenColor,
                textColor: AppColors.white,
                isRoundedCorner: true,
                text: buttonText,
                onClick: () {
                  if (onDoneClick != null) {
                    onDoneClick!();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
