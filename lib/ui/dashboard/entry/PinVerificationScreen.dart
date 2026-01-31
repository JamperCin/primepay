import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/PinController.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinVerificationScreen extends StatelessWidget {
  final PinController? controller;
  final Function(String)? successCallBack;
  final Function()? onResendCode;
  final String title;
  final String message;
  final String appBarTitle;
  final String buttonText;
  final String card16DigitCode;
  final String amountToPay;

  PinVerificationScreen({
    this.successCallBack,
    this.onResendCode,
    this.controller,
    this.appBarTitle = "Pin Verification",
    this.buttonText = "Verify",
    this.title = "Welcome",
    this.message = "Login with your Security Pin",
    this.card16DigitCode = "",
    this.amountToPay = "0.0",
  }) {
    controller?.card16DigitCode = this.card16DigitCode;
    controller?.amountToPay = this.amountToPay;
  }

  @override
  Widget build(BuildContext context) {
    controller?.setCurrentContext(context);

    return GestureDetector(
      onTap: () {
        controller?.dismissKeyBoard();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: new IconThemeData(
            color: AppColors.primaryGreenColor,
          ),
          title: Text("$appBarTitle", style: AppTextStyles.h2StyleBold),
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen32, right: AppDimens.dimen32),
            child: ListView(
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/verify.jpg",
                  height: AppDimens.dimen180,
                )),
                SizedBox(height: AppDimens.dimen30),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getStyle(
                      AppTextStyles.h1StyleRegular, Colors.black87),
                ),
                SizedBox(
                  height: AppDimens.dimen5,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleLight,
                    Colors.black87,
                  ),
                ),
                SizedBox(height: AppDimens.dimen30),
                Column(
                  children: [
                    pinTextField(controller?.pinCode ?? "".obs, call: (val) {
                      controller?.onPinEntered(val);
                      controller?.dismissKeyBoard();
                    }),
                    SizedBox(
                      height: AppDimens.dimen30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller?.clearPin();
                          },
                          child: Text(
                            'Clear Pin',
                            style: AppTextStyles.getStyle(
                                AppTextStyles.descStyleRegular, AppColors.red),
                          ),
                        ),
                        OutLinedButton(
                          textColor: AppColors.merGreen,
                          text: "Resend SMS",
                          outlineColor: AppColors.merGreen,
                          elevation: 0,
                          appTextStyle: AppTextStyles.subDescRegular,
                          onClick: () {
                            controller?.clearPin();
                            controller?.sendVerificationCode(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pinTextField(
    RxString pin, {
    int codeLength = 6,
    Function(String)? call,
  }) {
    return Obx(
      () => PinFieldAutoFill(
        decoration: UnderlineDecoration(
          textStyle:
              TextStyle(fontSize: AppDimens.dimen24, color: Colors.black),
          colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
        ),
        currentCode: pin.value,
        codeLength: codeLength,
        onCodeSubmitted: (code) {
          pin.value = code;
          if (code.length == (codeLength)) {
            if (call != null) call(code);
          }
        },
        onCodeChanged: (code) {
          pin.value = code!;
          if (code.length == (codeLength)) {
            if (call != null) call(code);
          }
        },
      ),
    );
  }
}
