import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/PaymentController.dart';
import 'package:prime_pay/data/model/local/PrimeCardModel.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';
import 'package:prime_pay/ui/utils/Utils.dart';
import 'package:prime_pay/ui/widgets/CircleImageView.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class CardDetailsScreen extends StatelessWidget {
  PaymentController controller = Get.put(PaymentController());
  final RxBool isSuccessCard = false.obs;
  String errorMessage = "";
  Rx<PrimeCardModel>? primeCardModel;
  final bool isCodeFromQrScan;
  double buttonSize = AppDimens.dimen60;

  CardDetailsScreen({this.isCodeFromQrScan = false}) {
    this.controller.errorText.value = "";

    Utils.startTimer(1, () {
      controller.isLoadingPayment.value = false;
      controller.amountText.value = "0";
      controller.fetchCardDetails((response) {
        if (response.success) {
          isSuccessCard.value = true;
          primeCardModel = response.data.account.card.obs;
          controller.cardAccount = response.data.account;

          controller.primeCardModel = primeCardModel?.value;
        } else {
          primeCardModel = PrimeCardModel().obs;
          errorMessage =
              "This card cannot be redeemed at the moment. One of the following may be the reason: "
              "\n\n1. Card does not exist or the 16-digit code of the card is invalid. "
              "\n\n2. Card does not belong to this merchant or any of its branches."
              "\n\n3. Card's purchase could not be completed or card does not exist on prime platform."
              "\n\n4. A genuine unknown error occurred during transaction. Kindly try again later or contact prime support team for immediate attention.";
          isSuccessCard.value = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return Obx(
      () => primeCardModel == null
          ? loadingLayout()
          : isSuccessCard.value
              ? mainLayout(isCodeFromScan: isCodeFromQrScan)
              : cardError(),
    );
  }

  ///An Error layout to show when card has an error
  Widget cardError() {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Error", style: AppTextStyles.h2StyleRegular),
        backgroundColor: AppColors.kWhiteColor,
        iconTheme: new IconThemeData(
          color: AppColors.darkText,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller
                  .showMerchantLogo(primeCardModel?.value.client.logoUrl ?? "");
            },
            child: Padding(
              padding: EdgeInsets.only(right: AppDimens.dimen20),
              child: Center(
                child: isSuccessCard.value
                    ? CircleImageView(
                        placeholderAsset: "assets/images/primepay.png",
                        avatarSize: AppDimens.dimen20,
                        imegeUrl: primeCardModel?.value.client.logoUrl ?? "",
                      )
                    : CircleImageView(
                        placeholderAsset: "assets/images/primepay.png",
                      ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: AppDimens.dimen10),
          controller.widgetUtils.noCartUI(message: errorMessage),
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );
  }

  ///Loading layout to show when loading
  Widget loadingLayout() {
    return GestureDetector(
      onTap: () {
        controller.dismissKeyBoard();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Redeem", style: AppTextStyles.h2StyleRegular),
          backgroundColor: AppColors.kWhiteColor,
          iconTheme: new IconThemeData(
            color: AppColors.darkText,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                controller.showMerchantLogo(
                    primeCardModel?.value.client.logoUrl ?? "");
              },
              child: Padding(
                padding: EdgeInsets.only(right: AppDimens.dimen20),
                child: Center(
                  child: isSuccessCard.value
                      ? CircleImageView(
                          placeholderAsset: "assets/images/primepay.png",
                          avatarSize: AppDimens.dimen20,
                          imegeUrl: primeCardModel?.value.client.logoUrl ?? "",
                        )
                      : CircleImageView(
                          placeholderAsset: "assets/images/primepay.png",
                        ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: AppDimens.dimen10),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimens.dimen5,
                right: AppDimens.dimen5,
              ),
              child: Column(
                children: [
                  ProfileShimmer(),
                  ProfileShimmer(),
                  ProfileShimmer(),
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
          ],
        ),
      ),
    );
  }

  ///This decides the main Layout for amount Entry or QR Scan
  Widget mainLayout({bool isCodeFromScan = false}) {
    return isCodeFromQrScan ? scanLayout() : amountEntryLayout();
  }

  ///Amount Entry layout
  Widget amountEntryLayout() {
    return Scaffold(
      backgroundColor: AppColors.merGreen,
      appBar: AppBar(
        elevation: 0,
        title: Text("Enter Amount",
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleRegular, AppColors.white)),
        backgroundColor: AppColors.merGreen,
        iconTheme: new IconThemeData(
          color: AppColors.white,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller.onScanOnClick();
            },
            child: Padding(
              padding: EdgeInsets.only(right: AppDimens.dimen20),
              child: Image.asset(
                "assets/images/scan.png",
                color: AppColors.white,
                height: AppDimens.dimen20,
                width: AppDimens.dimen20,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.dimen24),
            child: Column(
              children: [
                Center(
                  child: Obx(
                    () => Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: SizeConfig.screenWidth * 0.8,
                          maxWidth: SizeConfig.screenWidth * 0.8,
                          minHeight: AppDimens.dimen100,
                          maxHeight: AppDimens.dimen100,
                        ),
                        child: Center(
                          child: AutoSizeText(
                            '¢ ${controller.amountText.value}',
                            style: AppTextStyles.titleStyleRegular.copyWith(
                              color: AppColors.white,
                              fontSize: AppDimens.dimen100,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimens.dimen40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('1'),
                    buttonWidget('2'),
                    buttonWidget('3'),
                  ],
                ),
                SizedBox(height: AppDimens.dimen40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('4'),
                    buttonWidget('5'),
                    buttonWidget('6'),
                  ],
                ),
                SizedBox(height: AppDimens.dimen40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('7'),
                    buttonWidget('8'),
                    buttonWidget('9'),
                  ],
                ),
                SizedBox(height: AppDimens.dimen40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonWidget('.'),
                    buttonWidget('0'),
                    buttonWidget("", isDelete: true),
                  ],
                ),
                SizedBox(height: AppDimens.dimen60),
                Container(
                  child: Obx(() => controller.isLoadingPayment.value
                      ? Column(
                          children: [
                            SizedBox(
                              height: AppDimens.dimen40,
                              width: AppDimens.dimen40,
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                            SizedBox(height: AppDimens.dimen10),
                            Text(
                              "Processing ...",
                              style: AppTextStyles.getStyle(
                                AppTextStyles.descStyleRegular,
                                AppColors.white,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: AppDimens.dimen40,
                          width: SizeConfig.screenWidth * 0.7,
                          child: OutLinedButton(
                            filledColor: AppColors.merGreen,
                            outlineColor: AppColors.white,
                            text: "Redeem",
                            elevation: 5,
                            appTextStyle: AppTextStyles.descStyleBold,
                            textColor: AppColors.white,
                            onClick: () {
                              controller.amountTextController.text =
                                  controller.amountText.value;
                              controller.confirmCardRedeem(false);
                            },
                          ),
                        )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scanLayout() {
    controller.isLoadingPayment.value = true;
    controller.initCardRedeem();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Redeem", style: AppTextStyles.h2StyleRegular),
        backgroundColor: AppColors.kWhiteColor,
        iconTheme: new IconThemeData(
          color: AppColors.darkText,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller
                  .showMerchantLogo(primeCardModel?.value.client.logoUrl ?? "");
            },
            child: Padding(
              padding: EdgeInsets.only(
                  right: AppDimens.dimen20, top: AppDimens.dimen10),
              child: Center(
                child: isSuccessCard.value
                    ? CircleImageView(
                        placeholderAsset: "assets/images/primepay.png",
                        avatarSize: AppDimens.dimen20,
                        imegeUrl: primeCardModel?.value.client.logoUrl ?? "",
                      )
                    : CircleImageView(
                        placeholderAsset: "assets/images/primepay.png",
                      ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: AppDimens.dimen10),
          Obx(
            () => controller.isLoadingPayment.value
                ? Padding(
                    padding: EdgeInsets.all(AppDimens.dimen32),
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
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
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ProfileShimmer(),
                      ProfileShimmer(),
                      ProfileShimmer(),
                      Padding(
                        padding: EdgeInsets.all(AppDimens.dimen32),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "${controller.errorText.value}",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.getStyle(
                                    AppTextStyles.descStyleLight,
                                    AppColors.red),
                              ),
                            ),
                            SizedBox(height: AppDimens.dimen50),
                            SizedBox(
                              height: AppDimens.dimen45,
                              width: SizeConfig.screenWidth,
                              child: OutLinedButton(
                                textColor: AppColors.white,
                                text: "Retry Redeem",
                                appTextStyle: AppTextStyles.h2StyleBold,
                                filledColor: AppColors.primaryGreenColor,
                                onClick: () {
                                  controller.isLoadingPayment.value = true;
                                  controller.initCardRedeem();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );
  }

  buttonWidget(String buttonText, {bool isDelete = false}) {
    return FloatingActionButton(
        backgroundColor: isDelete ? AppColors.grey : AppColors.merGreen,
        focusColor: Colors.blue,
        hoverColor: Colors.blue,
        elevation: 10,
        heroTag: "here_$buttonText",
        child: isDelete
            ? Icon(
                Icons.backspace,
                size: AppDimens.dimen20,
                color: Colors.white,
              )
            : Text(
                buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
        onPressed: () {
          ///Handle delete button here
          if (isDelete) {
            if (controller.amountText.value.length > 0) {
              controller.amountText.value = controller.amountText.value
                  .substring(0, controller.amountText.value.length - 1);

              controller.amountText.value =
                  "${Utils.parseIntMoney(controller.amountText.value)}";
            }
            return;
          }

          ///Handle the rest of numbers below
          if (buttonText == "." && controller.amountText.value.contains(".")) {
            return;
          }
          controller.amountText.value =
              controller.amountText.value + buttonText;
          controller.amountText.value =
              "${Utils.parseIntMoney(controller.amountText.value)}";
        });
  }

  iconButtonWidget() {
    return InkWell(
      onTap: () {
        if (controller.amountText.value.length > 0) {
          controller.amountText.value = controller.amountText.value
              .substring(0, controller.amountText.value.length - 1);

          controller.amountText.value =
              "${Utils.parseIntMoney(controller.amountText.value)}";
        }
      },
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.backspace,
            size: AppDimens.dimen20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
