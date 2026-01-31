import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/PaymentController.dart';
import 'package:prime_pay/ui/utils/Utils.dart';
import 'package:prime_pay/ui/widgets/CardLayoutWidget.dart';
import 'package:prime_pay/ui/widgets/CircleImageView.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class QrScanSuccessScreen extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());
  String? card16DigitCode;

  QrScanSuccessScreen({String card16DigitCode = ""}) {
    this.card16DigitCode = card16DigitCode;
    controller.card16DigitCode = card16DigitCode;
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kWhiteColor,
          iconTheme: new IconThemeData(
            color: AppColors.darkText,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.only(
                  left: AppDimens.dimen32,
                  right: AppDimens.dimen32,
                  bottom: AppDimens.dimen32),
              child: Column(
                children: [
                  Center(
                    child: CircleImageView(),
                  ),
                  SizedBox(height: AppDimens.dimen20),
                  Text(
                    "${controller.primeCardModel?.clientName ?? ""}",
                    style: AppTextStyles.h2StyleRegular,
                  ),
                  SizedBox(height: AppDimens.dimen20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "${controller.primeCardModel?.title ?? controller.primeCardModel?.promotionTitle ?? ""}",
                          style: AppTextStyles.descStyleLight,
                        ),
                      ),
                      Flexible(
                          flex: 0,
                          child: Container(
                            color: AppColors.dark_grey,
                            height: AppDimens.dimen30,
                            width: 1,
                          )),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "*********670",
                          style: AppTextStyles.descStyleLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen20),
                  Text(
                    "Abeka Lapaz, Accra Ghana",
                    style: AppTextStyles.descStyleRegular,
                  ),
                  SizedBox(height: AppDimens.dimen80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CardLayoutWidget(
                          elevation: 0,
                          borderColor: AppColors.kSmokeWhite,
                          borderRadius: 0,
                          height: AppDimens.dimen80,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Icon(Icons.monetization_on_outlined),
                              SizedBox(height: AppDimens.dimen10),
                              Flexible(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              "${controller.primeCardModel != null ? controller.primeCardModel?.currency ?? controller.CURRENCY : "¢"}  ",
                                          style: AppTextStyles.getStyle(
                                            AppTextStyles.descStyleBold,
                                            AppColors.primaryGreenColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${Utils.moneyFormat("${controller.primeCardModel?.amount}")}",
                                          style: AppTextStyles.getStyle(
                                            AppTextStyles.descStyleBold,
                                            AppColors.primaryGreenColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CardLayoutWidget(
                          elevation: 0,
                          height: AppDimens.dimen80,
                          width: MediaQuery.of(context).size.width,
                          borderColor: AppColors.kSmokeWhite,
                          borderRadius: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/discount.png",
                                height: AppDimens.dimen20,
                              ),
                              SizedBox(height: AppDimens.dimen10),
                              Flexible(
                                child: RichText(
                                  text: new TextSpan(
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: '0.00',
                                        style: new TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppDimens.h2,
                                          fontFamily: AppStrings.FONT_FAMILY,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Total Amount",
                              style: AppTextStyles.subDescRegular,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Discounted Amount",
                              style: AppTextStyles.subDescRegular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen80),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "${controller.primeCardModel != null ? controller.primeCardModel?.currency ?? controller.CURRENCY : "¢"}  ",
                          style: AppTextStyles.getStyle(
                            AppTextStyles.h1StyleBold,
                            AppColors.primaryGreenColor,
                          ),
                        ),
                        TextSpan(
                          text:
                              "${Utils.moneyFormat("${controller.primeCardModel?.amount}")}",
                          style: AppTextStyles.getStyle(
                            AppTextStyles.h1StyleBold,
                            AppColors.primaryGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    "Total Payable Amount:  ",
                    style: AppTextStyles.descStyleLight,
                  ),
                  SizedBox(height: AppDimens.dimen60),
                  Container(
                    child: Obx(
                      () => controller.isLoadingPayment.value
                          ? Column(
                              children: [
                                SizedBox(
                                  height: AppDimens.dimen70,
                                  width: AppDimens.dimen70,
                                  child: CircularProgressIndicator(),
                                ),
                                SizedBox(height: AppDimens.dimen20),
                                Text(
                                  "Processing ...",
                                  style: AppTextStyles.descStyleRegular,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: AppDimens.dimen45,
                              width: MediaQuery.of(context).size.width,
                              child: OutLinedButton(
                                textColor: AppColors.white,
                                text: "Retry Redeem",
                                appTextStyle: AppTextStyles.h2StyleBold,
                                filledColor: AppColors.primaryGreenColor,
                                onClick: () {
                                  controller.isLoadingPayment.value = true;
                                },
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
