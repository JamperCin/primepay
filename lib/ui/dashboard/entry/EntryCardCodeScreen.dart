import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/PaymentController.dart';
import 'package:prime_pay/data/model/local/data_param.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';
import 'package:prime_pay/ui/widgets/QuestionsTextField.dart';
import 'package:sms_autofill/sms_autofill.dart';

class EntryCardCodeScreen extends BaseScreenStandard {
  final PaymentController controller = Get.put(PaymentController());

  EntryCardCodeScreen() {
    controller.cardNumberTextController.clear();
    controller.amountTextController.clear();
    initSmsPlugin();
  }

  void initSmsPlugin() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    controller.setParam((baseObject is DataParam) ? baseObject : null);
    debugPrint("Entr --> ${baseObject.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);
    return GestureDetector(
      onTap: () {
        controller.dismissKeyBoard();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(controller.dataParam?.data['title'] ?? "Redeem Card", style: AppTextStyles.h2StyleRegular),
          backgroundColor: AppColors.kWhiteColor,
          iconTheme: new IconThemeData(
            color: AppColors.darkText,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: AppDimens.dimen16,
              right: AppDimens.dimen32,
              left: AppDimens.dimen32),
          child: ListView(
            children: [
              SizedBox(height: AppDimens.dimen30),
              Image.asset("assets/images/card.png", height: AppDimens.dimen200),
              SizedBox(height: AppDimens.dimen70),
              Text(
                "Enter Card's 16-Digit Code",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2StyleRegular,
              ),
              SizedBox(height: AppDimens.dimen10),
              QuestionsTextField(
                maxLength: 16,
                textInputAction: TextInputAction.done,
                keyBoardType: TextInputType.number,
                hintText: "0000 0000 0000 0000",
                controller: controller.cardNumberTextController,
                textStyle: AppTextStyles.titleStyleRegular,
                selfFocusNode: controller.cardFocusNode,
                suffix: Icons.add_chart,
                textAlign: TextAlign.center,
                onTextChanged: (code) {
                  if (code.length == 16) {
                    controller.dismissKeyBoard();
                  }
                },
              ),
              SizedBox(height: AppDimens.dimen100),
              SizedBox(
                height: AppDimens.dimen50,
                width: AppDimens.dimen250,
                child: OutLinedButton(
                  onClick: () {
                    controller.goToCardDetails();
                  },
                  filledColor: AppColors.merGreen,
                  outlineColor: AppColors.merGreen,
                  text:controller.dataParam?.data['buttonTitle'] ?? "Redeem",
                  textColor: AppColors.white,
                  appTextStyle: AppTextStyles.h2StyleRegular,
                ),
              ),
              SizedBox(height: AppDimens.dimen100),
              /*Obx(
                () => controller.isLoadingPayment.value
                    ? Column(
                        children: [
                          SizedBox(
                            height: AppDimens.dimen70,
                            width: AppDimens.dimen70,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.merGreen),
                            ),
                          ),
                          SizedBox(height: AppDimens.dimen20),
                          Text(
                            "Processing Payment ...",
                            style: AppTextStyles.descStyleRegular,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: AppDimens.dimen50,
                        width: AppDimens.dimen250,
                        child: OutLinedButton(
                          onClick: () {
                            controller.confirmVerificationCode();
                          },
                          filledColor: AppColors.merGreen,
                          outlineColor: AppColors.merGreen,
                          text: "Redeem",
                          textColor: AppColors.white,
                          appTextStyle: AppTextStyles.h2StyleRegular,
                        ),
                      ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
