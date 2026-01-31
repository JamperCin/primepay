import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/LoginController.dart';
import 'package:prime_pay/ui/widgets/CheckBoxWidget.dart';
import 'package:prime_pay/ui/widgets/InputTextFieldWidget.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return GestureDetector(
      onTap: () {
        controller.dismissKeyBoard();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(AppDimens.dimen32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Image.asset(
                    "assets/images/primepay.png",
                    width: AppDimens.dimen120,
                    height: AppDimens.dimen120,
                  )),
                  SizedBox(height: AppDimens.dimen60),
                  Text('Welcome',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.getStyle(
                          AppTextStyles.h1StyleRegular, Colors.black87)),
                  SizedBox(height: AppDimens.dimen70),
                  InputTextFieldWidget(
                    labelText: "Username/Email/Phone number".toUpperCase(),
                    suffix: Icons.person,
                    keyBoardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    selfFocusNode: controller.phoneFocusNode,
                    nextFocusNode: controller.passwordFocusNode,
                    controller: controller.phoneTextController,
                  ),
                  SizedBox(height: AppDimens.dimen10),
                  InputTextFieldWidget(
                    labelText: "Password".toUpperCase(),
                    isSecure: true,
                    keyBoardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    selfFocusNode: controller.passwordFocusNode,
                    controller: controller.passwordTextController,
                    onGoOnClick: () {
                      controller.initLoginRequest();
                    },
                  ),
                  Obx(
                    () => CheckBoxWidget(
                      onCheckedChanged: (isChecked) {
                        controller.setRememberMe(isChecked);
                      },
                      text: "Remember me",
                      isChecked: controller.rememberMe.value,
                      textStyle: AppTextStyles.subDescStyleLight,
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen100),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDimens.dimen32, right: AppDimens.dimen32),
                    child: SizedBox(
                      height: AppDimens.dimen45,
                      child: OutLinedButton(
                        filledColor: AppColors.primaryGreenColor,
                        text: "Log In",
                        textColor: AppColors.white,
                        appTextStyle: AppTextStyles.descStyleBold,
                        onClick: () {
                          controller.initLoginRequest();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen50),
                ],
              ),
            ),
          ),
        ),
       /* bottomNavigationBar: Container(
          height: AppDimens.dimen80,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/jackbuild_logo.png",
                  height: AppDimens.dimen30,
                ),
              ),
              Text(
                "powered by",
                textAlign: TextAlign.center,
                style: AppTextStyles.getStyle(
                    AppTextStyles.smallestSubDescStyleUltraLight,
                    AppColors.black),
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}
