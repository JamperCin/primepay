import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/ui/dashboard/fund_card/fund_card_screen.dart';
import 'package:prime_pay/ui/dashboard/home/HomeScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/ScanQrCodeScreen.dart';
import 'package:prime_pay/ui/dashboard/settings/settings_screen.dart';
import 'package:prime_pay/ui/dashboard/transaction/disbursement_history.dart';
import 'package:prime_pay/ui/dashboard/transaction/redemption_screen.dart';

import '../app/AppColors.dart';
import '../data/enum/BottomBarIndex.dart';

class MainLandingController extends BaseController {
  RxList<Widget> screenView = RxList();
  RxList<BottomBarIndex> drawerIndex = RxList();

  RxList<Color> bottomItemColors = [
    AppColors.kYellowDeepColor,
    AppColors.white,
    AppColors.white,
    AppColors.white,
  ].obs;

  @override
  void onInit() {
    initWidgets();
    super.onInit();
  }

  void initDefaultScreen() {
    screenView.add(HomeScreen());
    drawerIndex.add(BottomBarIndex.HOME);
  }

  Widget screen() {
    return screenView.length > 0 ? screenView[0] : HomeScreen();
  }

  ///Reset all bottom Colors to WHITE and after that set the indexed item's Color to YELLOW
  void setBottomItemColor(int index) {
    for (int i = 0; i < bottomItemColors.length; i++) {
      bottomItemColors[i] = AppColors.white;
    }
    bottomItemColors[index] = AppColors.kYellowDeepColor;
  }

  void onBottomItemOnClick(BottomBarIndex index) {
    screenView.clear();
    drawerIndex.clear();
    drawerIndex.add(index);

    switch (index) {
      case BottomBarIndex.HOME:
        screenView.add(HomeScreen());
        setBottomItemColor(0);
        break;

      case BottomBarIndex.REDEMPTION_HISTORY:
        screenView.add(RedemptionScreen()); //Not implemented
        setBottomItemColor(1);
        break;

      case BottomBarIndex.DISBURSEMENT_HISTORY:
        screenView.add(DisbursementHistory());
        setBottomItemColor(2);
        break;

      case BottomBarIndex.SETTINGS:
        screenView.add(SettingsScreen());
        setBottomItemColor(3);
        break;

      case BottomBarIndex.FUND_CARD:
        screenView.add(FundCardScreen());
        setBottomItemColor(1);
        break;
    }
  }
}
