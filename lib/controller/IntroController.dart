import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/data/model/local/IntroModel.dart';
import 'package:prime_pay/main.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';
import 'package:prime_pay/ui/login/LoginScreen.dart';

import 'BaseController.dart';

class IntroController extends BaseController {
  RxInt currentIndex = 0.obs;

  void onChange(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  static List<IntroModel> introList = [
    IntroModel(
      imageAsset: "assets/images/intro_1.png",
      title: "Branded E-Gift cards",
      message:
          "Branded E-Gift cards are powerful business tools to help your company grow and increase audience’s engagement.",
      color: AppColors.white,
      textColor: AppColors.black,
      bgAsset: "assets/images/bg_1.png",
      showBgAsset: false,
    ),
    IntroModel(
      imageAsset: "assets/images/intro_2.png",
      title: "Instant Sale",
      message:
          "Prime Gift Cards gives business owners a platform to create, sell and market their own branded eGift cards, as well as track all transactions in real-time!",
      color: AppColors.white,
      textColor: AppColors.black,
      bgAsset: "assets/images/bg_2.png",
      showBgAsset: false,
    ),
    IntroModel(
      imageAsset: "assets/images/intro_3.png",
      title: "Merchant Dashboard",
      message:
          "Here’s where your business has access to all the tools you’ll need to create, sell, track and promote your eGift cards.",
      color: AppColors.white,
      textColor: AppColors.black,
      bgAsset: "assets/images/bg_3.png",
      showBgAsset: false,
    ),
    IntroModel(
      imageAsset: "assets/images/intro_4.png",
      title: "Sell Directly on Facebook and Instagram",
      message:
          "Easily promote your cards to clients & their network on social media to increase awareness and to maximize your gift card selling potential!",
      color: AppColors.white,
      textColor: AppColors.black,
      bgAsset: "assets/images/bg_3.png",
      showBgAsset: false,
    )
  ];

  void onDoneOnClick() {
    preference?.setBool(PrefConstants.IS_INTRO_SHOWN, true);
    if (isLogin) {
      Get.offAll(MainLandingScreen());
    } else {
      Get.offAll(LoginScreen());
    }
  }
}
