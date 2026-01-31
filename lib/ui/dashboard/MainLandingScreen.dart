import 'package:badges/badges.dart' as badge;
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/controller/MainLandingController.dart';

import '../../app/AppColors.dart';
import '../../app/AppDimens.dart';
import '../../app/AppTextStyles.dart';
import '../../data/enum/BottomBarIndex.dart';

class MainLandingScreen extends BaseScreenStandard {
  MainLandingController controller = Get.put(MainLandingController());

  MainLandingScreen() {
    controller.initDefaultScreen();
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return SafeArea(
        child: Scaffold(
      body: Obx(() => controller.screen()),
      bottomNavigationBar: bottomNavigation(),
    ));
  }

  Widget bottomNavigation() {
    return Obx(
      () => BottomAppBar(
        color: AppColors.primaryGreenColor,
        elevation: 20,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen8,
            right: AppDimens.dimen8,
            top: AppDimens.dimen3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomNavItem(
                text: "Home",
                icon: Icons.home,
                iconColor: controller.bottomItemColors[0],
                onTap: () {
                  controller.onBottomItemOnClick(BottomBarIndex.HOME);
                },
              ),
            //  SizedBox(width: AppDimens.dimen35),
            //   bottomNavItem( TODO Needs this feature in future update, for now hide it
            //     icon: Icons.monetization_on_outlined,
            //     text: "Fund Card",
            //     count: 10.obs,
            //     iconColor: controller.bottomItemColors[1],
            //     onTap: () {
            //       controller
            //           .onBottomItemOnClick(BottomBarIndex.FUND_CARD);
            //     },
            //   ),
              // Spacer(),
              // SizedBox(width: AppDimens.dimen35),
              bottomNavItem(
                icon: Icons.payments,
                text: "Disbursement",
                iconColor: controller.bottomItemColors[2],
                onTap: () {
                  controller
                      .onBottomItemOnClick(BottomBarIndex.DISBURSEMENT_HISTORY);
                },
              ),
              // SizedBox(width: AppDimens.dimen35),
              bottomNavItem(
                icon: Icons.settings,
                text: "Settings",
                iconColor: controller.bottomItemColors[3],
                onTap: () {
                  controller.onBottomItemOnClick(BottomBarIndex.SETTINGS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavItem({
    String? text,
    IconData? icon,
    bool isBadge = false,
    RxInt? count,
    GestureTapCallback? onTap,
    double? iconSize,
    Color iconColor = Colors.white,
  }) {
    count = count ?? 0.obs;
    iconSize = iconSize ?? AppDimens.dimen20;

    ///return item
    return InkWell(
      splashColor: AppColors.white,
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isBadge
                ? badge.Badge(
                    badgeStyle: badge.BadgeStyle(
                      padding: EdgeInsets.all(AppDimens.dimen4),
                    ),
                    badgeContent: Text(
                      '$count',
                      style: AppTextStyles.smallSubDescStyleSemiBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  )
                : Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                  ),
            SizedBox(height: AppDimens.dimen2),
            text != null
                ? Text(
                    text,
                    style: AppTextStyles.smallerSubDescStyleLight.copyWith(
                      color: iconColor,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
