import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/LoginController.dart';
import 'package:prime_pay/ui/login/LoginScreen.dart';
import 'package:prime_pay/ui/widgets/RoundButton.dart';

import '../../main.dart';

class QuickLogin extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  QuickLogin() {
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen32,
          right: AppDimens.dimen32,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                "assets/images/quick_login.jpg",
                // width: AppDimens.dimen100,
                height: AppDimens.dimen250,
              ),
            ),
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: AppTextStyles.getStyle(
                  AppTextStyles.h1StyleBold, AppColors.black),
            ),
            SizedBox(height: AppDimens.dimen40),
            Obx(
              () => controller.isProgressLoading.value
                  ? Column(
                      children: [
                        Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            height: AppDimens.dimen80,
                            width: AppDimens.dimen80,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: AppDimens.dimen20),
                        RoundButton(
                          buttonRadius: 2,
                          color: AppColors.black,
                          text: "Quick Log In",
                          onClick: () {
                            controller.initQuickLogin();
                          },
                        ),
                        SizedBox(height: AppDimens.dimen10),
                        Text(
                          "Click here to login and have access to your account faster and easier.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.descStyleUltraLight,
                        ),
                        SizedBox(height: AppDimens.dimen80),
                        RoundButton(
                          buttonRadius: 2,
                          color: AppColors.merGreen,
                          text: "Log In",
                          onClick: () {
                            Get.to(LoginScreen());
                          },
                        ),
                        SizedBox(height: AppDimens.dimen10),
                        Text(
                          "Go to LogIn Screen",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.descStyleUltraLight,
                        ),
                      ],
                    ),
            ),
          ],
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
    );
  }
}
