import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class WidgetUtils {
  BuildContext? mContext;
  Timer? timer;

  void setCurrentContext(BuildContext mContext) {
    this.mContext = mContext;
  }

  static Decoration deco({
    BorderRadiusGeometry? border,
    double borderRadius = 10,
    double opacity = 0.4,
    double borderWidth = 1,
    Color? color,
    Color? borderColor,
    Color? colorOpacity,
    double blurRadius = 5,
    BoxBorder? borderSide,
    bool applyBorder = true,
  }) {
    return BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: applyBorder
            ? (border ?? BorderRadius.all(Radius.circular(borderRadius)))
            : null,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorOpacity ?? AppColors.grey.withOpacity(opacity),
            offset: const Offset(1.1, 1.1),
            blurRadius: blurRadius,
          ),
        ],
        border: borderSide ??
            Border.all(
              color: borderColor ?? AppColors.white,
              width: borderWidth,
            ));
  }

  void showProgressBar() {
    Loader.show(
      mContext ?? Get.context!,
      progressIndicator: SizedBox(
        child: CircularProgressIndicator(),
        height: AppDimens.dimen70,
        width: AppDimens.dimen70,
      ), //Lottie.network(AppLottie.PROGRESS_LOADER, height: 100),

      themeData: Theme.of(mContext ?? Get.context!)
          .copyWith(focusColor: Colors.black38),
      overlayColor: Color(0x99E8EaF6),
    );

    startTimer(30, () {
      dismissProgressBar();
    });
  }

  ///Start Timer
  void startTimer(int time, Function onclick) {
    List<int> list = [];
    const oneSec = const Duration(seconds: 1);
    Timer timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        this.timer = timer;
        list.add(oneSec.inHours);
        if (list.length == time) {
          timer.cancel();
          if (onclick != null) {
            onclick();
          }
        }
      },
    );
  }

  void dismissProgressBar() {
    Loader.hide();
    if (timer != null) {
      timer?.cancel();
    }
  }

  void showGeneralSnackBar({String message = "", String title = ""}) {
    Get.snackbar(
      title,
      message,
      icon: Icon(
        Icons.info_outline,
        color: AppColors.white,
      ),
      backgroundColor: AppColors.skyBlueColor,
      titleText: Text(title,
          style: AppTextStyles.getStyle(
              AppTextStyles.descStyleBold, Colors.white)),
      messageText: Text(
        message,
        style:
            AppTextStyles.getStyle(AppTextStyles.descStyleLight, Colors.white),
      ),
    );
  }

  void showErrorSnackBar(String message) {
    Get.snackbar("Error", message,
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        titleText: Text('Error',
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleBold, Colors.red)),
        messageText: Text(message,
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleLight, Colors.red)));
  }

  void showSuccessSnackBar(String message) {
    Get.snackbar("Success", message,
        icon: Icon(
          Icons.done,
          color: AppColors.secondaryGreenColor,
        ),
        colorText: AppColors.primaryGreenColor,
        backgroundColor: Colors.white,
        titleText: Text('Success',
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleBold, AppColors.secondaryGreenColor)),
        messageText: Text(message,
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleMedium, AppColors.primaryGreenColor)));
  }

  void verifyPhoneNumber(
    String jsonPath,
    String title,
    Widget message,
    String buttonText,
    Function onClick,
  ) {
    Get.bottomSheet(
      Container(
        height: jsonPath.isNotEmpty ? AppDimens.dimen380 : AppDimens.dimen260,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
        padding: EdgeInsets.only(
            top: AppDimens.dimen16,
            bottom: AppDimens.dimen16,
            right: AppDimens.dimen32,
            left: AppDimens.dimen32),
        //color: AppColors.background,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Icon(Icons.close),
                alignment: Alignment.topRight,
              ),
            ),
            jsonPath.isNotEmpty
                ? Image.network(jsonPath, height: AppDimens.dimen120)
                : Text(""),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.getStyle(
                  AppTextStyles.h2StyleBold, AppColors.secondaryGreenColor),
            ),
            SizedBox(
              height: AppDimens.dimen10,
            ),
            message,
            SizedBox(
              height: AppDimens.dimen40,
            ),
            SizedBox(
              height: AppDimens.dimen45,
              child: OutLinedButton(
                filledColor: AppColors.secondaryGreenColor,
                selectedColor: AppColors.red,
                outlineColor: AppColors.secondaryGreenColor,
                appTextStyle: AppTextStyles.descStyleBold,
                textColor: AppColors.white,
                isRoundedCorner: true,
                text: buttonText,
                onClick: () {
                  Get.back();
                  onClick();
                },
              ),
            ),
          ],
        ),
      ),
      enableDrag: true,
      isDismissible: true,
    );
  }

  void showSuccessSignUpSheet(Function onClick) {
    showSuccessSheet(
      "https://assets5.lottiefiles.com/packages/lf20_uvPY2t.json",
      "SUCCESS!!!",
      "Thank you for signing up on Meya.",
      "Kindly proceed to login with your credentials and start experiencing the greatness",
      "Login",
      onClick,
    );
  }

  void showSuccessSheet(
    String jsonPath,
    String title,
    String message,
    String subMessage,
    String buttonText,
    Function onClick,
  ) {
    Get.bottomSheet(
        Container(
          height: AppDimens.dimen380,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
          ),
          padding: EdgeInsets.only(
              top: AppDimens.dimen8,
              left: AppDimens.dimen32,
              right: AppDimens.dimen32,
              bottom: AppDimens.dimen16),
          //color: AppColors.background,
          child: ListView(
            children: [
              Image.network(jsonPath, height: AppDimens.dimen120),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.getStyle(
                    AppTextStyles.h2StyleBold, AppColors.secondaryGreenColor),
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleLight, AppColors.darkText),
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              Text(
                subMessage,
                textAlign: TextAlign.center,
                style: AppTextStyles.getStyle(
                    AppTextStyles.subDescStyleUltraLight, AppColors.darkText),
              ),
              SizedBox(
                height: AppDimens.dimen40,
              ),
              SizedBox(
                width: AppDimens.dimen170,
                height: AppDimens.dimen45,
                child: OutLinedButton(
                  selectedColor: AppColors.red,
                  outlineColor: AppColors.secondaryGreenColor,
                  appTextStyle: AppTextStyles.descStyleBold,
                  filledColor: AppColors.secondaryGreenColor,
                  textColor: AppColors.white,
                  isRoundedCorner: true,
                  text: buttonText,
                  onClick: () {
                    Get.back();
                    onClick();
                  },
                ),
              ),
            ],
          ),
        ),
        isDismissible: false);
  }

  void showBottomDialog({
    String jsonPath = "",
    String title = "",
    Widget? child,
    Widget? mainChild,
    Widget? parent,
    String buttonText = "",
    bool showButton = false,
    bool isRoundedCorner = false,
    bool isDismissable = true,
    bool isDraggable = true,
    Color backgroundColor = AppColors.background,
    Function? onClick,
    double? containerSize,
    EdgeInsetsGeometry? padding,
    double lottieSize = 80,
    Color buttonColor = AppColors.primaryGreenColor,
  }) {
    containerSize = containerSize == null ? AppDimens.dimen400 : containerSize;
    padding = padding == null
        ? EdgeInsets.only(
            top: AppDimens.dimen16,
            bottom: AppDimens.dimen16,
            right: AppDimens.dimen32,
            left: AppDimens.dimen32)
        : padding;
    Get.bottomSheet(
      parent == null
          ? Container(
              height: containerSize,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
              ),
              padding: padding,
              //color: AppColors.background,
              child: mainChild == null
                  ? ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Icon(Icons.close),
                            alignment: Alignment.topRight,
                          ),
                        ),
                        jsonPath.isNotEmpty
                            ? Image.network(jsonPath, height: lottieSize)
                            : Text(""),
                        SizedBox(
                          height: AppDimens.dimen10,
                        ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.getStyle(
                              AppTextStyles.h2StyleBold,
                              AppColors.secondaryGreenColor),
                        ),
                        SizedBox(
                          height: AppDimens.dimen10,
                        ),
                        child == null ? Text("") : child,
                        SizedBox(
                          height: showButton
                              ? AppDimens.dimen40
                              : AppDimens.dimen10,
                        ),
                        showButton
                            ? Container(
                                padding: EdgeInsets.only(
                                    left: AppDimens.dimen32,
                                    right: AppDimens.dimen32),
                                child: SizedBox(
                                  height: AppDimens.dimen45,
                                  width: AppDimens.dimen200,
                                  child: OutLinedButton(
                                    filledColor: buttonColor,
                                    selectedColor: AppColors.red,
                                    outlineColor: buttonColor,
                                    appTextStyle: AppTextStyles.descStyleBold,
                                    textColor: AppColors.white,
                                    isRoundedCorner: isRoundedCorner,
                                    text: buttonText,
                                    onClick: () {
                                      Get.back();
                                      if (onClick != null) onClick();
                                    },
                                  ),
                                ),
                              )
                            : Text(""),
                      ],
                    )
                  : mainChild,
            )
          : parent,
      enableDrag: isDraggable,
      isDismissible: isDismissable,
    );
  }

  Widget noCartUI({
    String asset = "assets/images/error.jpg",
    TextAlign textAlign = TextAlign.start,
    String title = "Error on this card",
    String message =
        "You have no cards saved to your cart. Kindly use the button below to start adding cards to cart.",
    bool showAddButton = false,
    Function? onAddOnclick,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: AppDimens.dimen25, right: AppDimens.dimen25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: AppDimens.dimen40),
          Image.asset(
            asset,
            height: AppDimens.dimen200,
          ),
          SizedBox(height: AppDimens.dimen10),
          Text(title,
              textAlign: TextAlign.center, style: AppTextStyles.h2StyleRegular),
          SizedBox(height: AppDimens.dimen20),
          Text(
            message,
            textAlign: textAlign,
            style: AppTextStyles.descStyleLight,
          ),
          SizedBox(height: AppDimens.dimen70),
          showAddButton
              ? FloatingActionButton(
                  backgroundColor: AppColors.primaryGreenColor,
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    if (onAddOnclick != null) onAddOnclick();
                  },
                )
              : SizedBox(),
          SizedBox(height: AppDimens.dimen100),
        ],
      ),
    );
  }
}
