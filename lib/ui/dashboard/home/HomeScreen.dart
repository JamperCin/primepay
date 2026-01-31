import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/app_bar_api.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/HomeController.dart';
import 'package:prime_pay/ui/dashboard/entry/EntryCardCodeScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/ScanQrCodeScreen.dart';
import 'package:prime_pay/ui/widgets/CircleImageView.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen() {
    controller.getMerchantDetails();
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarApi.appBarLight(
          leadingIcon: Padding(
            padding: EdgeInsets.only(
              left: AppDimens.dimen16,
              top: AppDimens.dimen5,
            ),
            child: CircleImageView(
              placeholderAsset: "assets/images/primepay.png",
              imegeUrl: "${controller.logoUrl.value}",
              //avatarSize: AppDimens.dimen30,
              //fit: BoxFit.fill,
            ),
          ),
          title: controller.getMerchant()?.name ?? ''),
      /* appBar: AppBar(
        elevation: 10,
        title: Text("Redeem Card", style: AppTextStyles.h2StyleRegular),
        backgroundColor: AppColors.kWhiteColor,
        iconTheme: new IconThemeData(
          color: AppColors.darkText,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimens.dimen16),
          child: Obx(
            () => GestureDetector(
              onTap: () {
                //controller.showMerchantLogo(controller.logoUrl.value);
              },
              child: CircleImageView(
                placeholderAsset: "assets/images/primepay.png",
                imegeUrl: "${controller.logoUrl.value}",
                //avatarSize: AppDimens.dimen30,
                //fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: AppDimens.dimen16),
              child: Icon(
                Icons.power_settings_new,
                color: Colors.red,
                size: AppDimens.dimen25,
              ),
            ),
            onTap: () {
              controller.onSignOutOnClick();
            },
          ),
        ],
      ),*/
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: AppDimens.dimen32, right: AppDimens.dimen32),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/ic_gift.jpg",
                height: AppDimens.dimen200,
              ),
              SizedBox(height: AppDimens.dimen20),
              SizedBox(
                height: AppDimens.dimen50,
                child: OutLinedButton(
                  onClick: () {
                    Get.to(ScanQrCodeScreen());
                  },
                  filledColor: AppColors.black,
                  outlineColor: AppColors.black,
                  customWidget: Padding(
                    padding: EdgeInsets.all(AppDimens.dimen8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Scan Qr Code",
                          style: AppTextStyles.getStyle(
                              AppTextStyles.h2StyleRegular, AppColors.white),
                        ),
                        Image.asset(
                          "assets/images/scan.png",
                          color: AppColors.white,
                          height: AppDimens.dimen24,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.dimen10),
              Center(
                child: Text(
                  "--OR--",
                  style: AppTextStyles.h2StyleRegular,
                ),
              ),
              SizedBox(height: AppDimens.dimen10),
              SizedBox(
                height: AppDimens.dimen50,
                child: OutLinedButton(
                  onClick: () {
                    navUtils.fireTarget(EntryCardCodeScreen());
                  },
                  filledColor: AppColors.merSky,
                  outlineColor: AppColors.merSky,
                  text: "Redeem 16 Digit Code",
                  textColor: AppColors.white,
                  appTextStyle: AppTextStyles.h2StyleRegular,
                ),
              ),
              SizedBox(height: AppDimens.dimen40),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Redeeming Card\n\n",
                      style: AppTextStyles.getStyle(
                        AppTextStyles.descStyleRegular,
                        AppColors.primaryGreenColor,
                      ),
                    ),
                    TextSpan(
                      text:
                          "1. Either Scan QR Code of customer or enter the 16-digit code given by customer.\n\n",
                      style: AppTextStyles.subDescStyleLight,
                    ),
                    TextSpan(
                      text:
                          "2. Enter an amount the customer wishes to redeem from the card (16-Digit Code).\n\n",
                      style: AppTextStyles.subDescRegular,
                    ),
                    TextSpan(
                      text:
                          "3. A 6-digit code will be sent to customer's number for verification purposes."
                          " Input the 6-digit code on the next screen to complete payment.\n\n",
                      style: AppTextStyles.subDescRegular,
                    ),
                    TextSpan(
                      text: "4. Hurray!!! your card has been redeemed.\n\n",
                      style: AppTextStyles.subDescRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
