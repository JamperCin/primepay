import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/app_bar_api.dart';
import 'package:prime_pay/api/ui_api.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/TransactionsController.dart';
import 'package:prime_pay/data/model/local/redemptions_model.dart';
import 'package:prime_pay/data/model/local/rich_text_model.dart';
import 'package:prime_pay/ui/utils/Utils.dart';
import 'package:prime_pay/ui/utils/date_time_utils.dart';
import 'package:prime_pay/ui/utils/number_utils.dart';

class RedemptionScreen extends StatelessWidget {
  final TransactionsController controller = Get.put(TransactionsController());

  RedemptionScreen() {
    controller.page = 1;
    Utils.startTimer(1, () {
      controller.fetchRedemptionHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarApi.appBarLight(title: 'Redemption History', elevation: 10),
      body: UiApi.listView(
        list: listview(context),
        scrollController: controller.scrollController,
        isLoadingMore: controller.isLoadingMore,
        padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen20,
        ),
      ),
    );
  }

  List<Widget> listview(BuildContext context) {
    List<Widget> list = <Widget>[];

    list.add(
      Obx(() => controller.isDoneLoading.value &&
              controller.mainRedemptionList.isNotEmpty
          ? historyWidget()
          : UiApi.loader()),
    );

    return list;
  }

  Widget historyWidget() {
    return Column(children: [
      ...controller.filteredList.map((element) => redemptionItemWidget(element))
    ]);
  }

  Widget redemptionItemWidget(RedemptionsModel pay) {
    return InkWell(
      onTap: () {
        // controller.prepareForReceiptPrinting(pay);
      },
      child: Container(
        decoration: UiApi.deco(
          applyBorder: false,
          borderSide: Border(
            right: BorderSide(
              color: Utils.getRedemptionStatusColor(pay.status),
              width: 3,
            ),
          ),
        ),
        padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen5,
          bottom: AppDimens.dimen5,
        ),
        margin: EdgeInsets.only(bottom: AppDimens.dimen5),
        child: Row(
          children: [
            Flexible(
              flex: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateTimeUtils.formatDateString(pay.createdAt, format: "dd"),
                    style: AppTextStyles.h5StyleMedium
                        .copyWith(color: AppColors.lightDark),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    DateTimeUtils.formatDateString(pay.createdAt,
                        format: "MMM yy"),
                    style: AppTextStyles.subDescStyleLight
                        .copyWith(fontSize: AppDimens.dimen10)
                        .copyWith(color: AppColors.lightDark),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              flex: 0,
              child: Container(
                width: .6,
                height: AppDimens.dimen50,
                color: AppColors.kSmokeWhite,
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiApi.richText(
                    mod: [
                      RichTextModel(
                        text: Utils.capitalizeLetter(
                            val: pay.cardAccount.cardOwner.person?.firstName,
                            capAllFirstLetters: true),
                        style: AppTextStyles.descStyleSemiBold,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen3),
                  UiApi.richText(
                    mod: [
                      RichTextModel(
                        text: "Amount:  ",
                        style: AppTextStyles.smallerSubDescStyleLight,
                      ),
                      RichTextModel(
                        text: NumberUtils.getCurrencyAmount(
                          pay.amount,
                          dec: 2,
                        ),
                        style: AppTextStyles.descStyleRegular,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  UiApi.richText(
                    mod: [
                      RichTextModel(
                        text: "Reference:  ",
                        style: AppTextStyles.smallerSubDescStyleLight,
                      ),
                      RichTextModel(
                        text: '${pay.hashCode}',
                        style: AppTextStyles.smallSubDescStyleRegular,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  UiApi.richText(
                    mod: [
                      RichTextModel(
                        text: "Status:  ",
                        style: AppTextStyles.smallerSubDescStyleLight,
                      ),
                      RichTextModel(
                        text: pay.status.toUpperCase().replaceAll("_", " "),
                        style: AppTextStyles.smallerSubDescStyleSemiBold
                            .copyWith(
                                color:
                                    Utils.getRedemptionStatusColor(pay.status)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_right, size: AppDimens.dimen20),
                  SizedBox(height: AppDimens.dimen10),
                  Text(
                    DateTimeUtils.formatDateString(pay.createdAt,
                        format: "hh:mm aa"),
                    style: AppTextStyles.smallestSubDescStyleRegular
                        .copyWith(color: AppColors.lightDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
