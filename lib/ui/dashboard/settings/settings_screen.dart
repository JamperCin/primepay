import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/settings_controller.dart';

import '../../../api/app_bar_api.dart';
import '../../../api/ui_api.dart';
import '../../../app/AppColors.dart';
import '../../utils/date_time_utils.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  SettingsScreen() {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);
    return Scaffold(
      appBar: AppBarApi.appBarLight(
        title: 'Settings',
        elevation: 10,
      ),
      body: UiApi.listView(
        list: listview(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen16,
          vertical: AppDimens.dimen20,
        ),
      ),
    );
  }

  List<Widget> listview(BuildContext context) {
    List<Widget> list = <Widget>[];

    list.add(Obx(
      () => (!controller.isLoading.value)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiApi.imageLoader(
                    url: controller.merchant?.logoUrl ?? '',
                    width: AppDimens.dimen100,
                    height: AppDimens.dimen100,
                    border: 0,
                    errorWidget:
                        UiApi.assetImage('assets/images/primepay.png')),
                SizedBox(height: AppDimens.dimen10),
                Text(
                  controller.merchant?.name ?? '',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${controller.merchant?.branch ?? ''} ${controller.merchant?.address ?? ''}',
                  style: AppTextStyles.descStyleRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppDimens.dimen5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        controller.getMerchant()?.telephone ?? '',
                        style: AppTextStyles.smallSubDescStyleRegular,
                      ),
                    ),
                    Container(
                      width: .9,
                      height: AppDimens.dimen20,
                      color: AppColors.kSmokeWhite,
                      margin: EdgeInsets.only(
                          left: AppDimens.dimen5, right: AppDimens.dimen5),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        controller.getMerchant()?.email ?? '',
                        style: AppTextStyles.smallSubDescStyleRegular,
                      ),
                    ),
                  ],
                )
              ],
            )
          : UiApi.loader(size: 1),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Divider(height: 2, color: AppColors.iconColor));

    list.add(Obx(
      () => (!controller.isLoading.value)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppDimens.dimen10),
                Text(
                  'Disbursement Account Details',
                  style: AppTextStyles.descStyleBold,
                ),
                SizedBox(height: AppDimens.dimen5),
                UiApi.infoText(
                    'An account to receive payments whenever a card redemption is done.'),
                SizedBox(height: AppDimens.dimen10),
                UiApi.container(
                  color: AppColors.background,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UiApi.billWidget(
                          "Account Type", "${controller.accountType()}"),
                      UiApi.billWidget("${controller.accountNetwork()}",
                          "${controller.bankAccount.value.bank}"),
                      UiApi.billWidget("Account Name",
                          "${controller.bankAccount.value.name}"),
                      UiApi.billWidget("Account Number",
                          "${controller.bankAccount.value.number}"),
                      UiApi.billWidget("Date Created",
                          "${DateTimeUtils.formatDateString(controller.bankAccount.value.createdAt)}",
                          showBorder: false),
                    ],
                  ),
                )
              ],
            )
          : UiApi.loader(size: 1),
    ));

    list.add(SizedBox(height: AppDimens.dimen80));

    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            controller.onSignOutOnClick();
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: AppDimens.dimen20,
                color: AppColors.redLight,
              ),
              Text(
                'Log Out',
                style: AppTextStyles.title.copyWith(color: AppColors.redLight),
              ),
            ],
          ),
        ),
      ],
    ));

    return list;
  }
}
