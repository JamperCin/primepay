import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/app_bar_api.dart';
import 'package:prime_pay/api/ui_api.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/data/enum/PrinterTypes.dart';
import 'package:prime_pay/data/model/local/payments_model.dart';
import 'package:prime_pay/data/model/local/rich_text_model.dart';
import 'package:prime_pay/main.dart';
import 'package:prime_pay/ui/utils/Utils.dart';
import 'package:prime_pay/ui/utils/number_utils.dart';

import '../../../app/AppColors.dart';
import '../../../app/AppTextStyles.dart';
import '../../../controller/disbursement_controller.dart';
import '../../../data/model/local/disbursement_model.dart';
import '../../utils/date_time_utils.dart';

class DisbursementHistory extends StatelessWidget {
  final DisbursementController controller = Get.put(DisbursementController());

  DisbursementHistory() {
    controller.page = 1;
    Utils.startTimer(1, () {
      controller.fetchDisbursementHistory();
      controller.checkForAppUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);

    return Scaffold(
      appBar: AppBarApi.appBarLight(
          //title: 'Disbursement History',
          appBarHeight: AppDimens.dimen100,
          titleWidget: Column(
            children: [
              Text(
                'Disbursement History',
                style: AppTextStyles.titleStyleSemiBold,
              ),
              SizedBox(height: AppDimens.dimen10),
              UiApi.searchBarWidget(onSearchChanged: controller.onSearchOffline),
              SizedBox(height: 10.dp()),
            ],
          )),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.fetchDisbursementHistory(pullToRefresh: true);
        },
        backgroundColor: AppColors.primaryGreenColor,
        color: AppColors.white,
        child: UiApi.listView(
          list: listview(context),
          scrollController: controller.scrollController,
          isLoadingMore: controller.isLoadingMore,
          padding: EdgeInsets.only(
            left: AppDimens.dimen10,
            right: AppDimens.dimen10,
            top: AppDimens.dimen20,
          ),
        ),
      ),
    );
  }

  List<Widget> listview(BuildContext context) {
    List<Widget> list = <Widget>[];

    list.add(Obx(() => controller.isDoneLoading.value &&
            controller.mainRedemptionList.isNotEmpty
        ? historyWidget()
        : controller.isDoneLoading.value &&
                controller.mainRedemptionList.isEmpty
            ? UiApi.noDataWidget()
            : UiApi.loader()));

    return list;
  }

  Widget historyWidget() {
    return Column(children: [
      ...controller.filteredList.map((element) => redemptionItemWidget(element))
    ]);
  }

  Widget redemptionItemWidget(DisbursementModel pay) {
    PaymentModel model =
        pay.payments.isNotEmpty ? pay.payments.first : PaymentModel();

    return InkWell(
      onTap: () {
        if (model.status.toUpperCase() == 'PAID' &&
            printerType != PrinterType.NO_PRINTING)
        controller.confirmPrinting(pay);
      },
      child: Container(
        decoration: UiApi.deco(
          applyBorder: false,
          borderSide: Border(
            right: BorderSide(
              color: Utils.getRedemptionStatusColor(model.status),
              width: 5,
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
                    style: AppTextStyles.h5StyleBold
                        .copyWith(color: AppColors.lightDark),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    DateTimeUtils.formatDateString(pay.createdAt,
                        format: "MMM yyyy"),
                    style: AppTextStyles.smallerSubDescStyleRegular
                        .copyWith(fontSize: AppDimens.dimen10)
                        .copyWith(color: AppColors.lightDark),
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    DateTimeUtils.formatDateString(pay.createdAt,
                        format: "hh:mm aa"),
                    style: AppTextStyles.smallerSubDescStyleRegular
                        .copyWith(fontSize: AppDimens.dimen10)
                        .copyWith(color: AppColors.orange),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              flex: 0,
              child: Container(
                width: .9,
                height: AppDimens.dimen80,
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
                      text: "Amount Disbursed:  ",
                      style: AppTextStyles.smallerSubDescStyleLight,
                    ),
                    pay.payments.isNotEmpty
                        ? RichTextModel(
                            text: NumberUtils.getCurrencyAmount(
                              model.amount,
                              dec: 2,
                            ),
                            style: AppTextStyles.descStyleBold,
                          )
                        : RichTextModel(
                            text: "processing...",
                            style: AppTextStyles.smallSubDescStyleLight
                                .copyWith(color: AppColors.orange),
                          )
                  ],
                ),
                SizedBox(height: AppDimens.dimen2),
                UiApi.richText(
                  mod: [
                    RichTextModel(
                      text: "Amount Redeemed:  ",
                      style: AppTextStyles.smallerSubDescStyleLight,
                    ),
                    pay.payments.isNotEmpty
                        ? RichTextModel(
                            text: NumberUtils.getCurrencyAmount(
                              pay.redemption.redemptionAmount,
                              dec: 2,
                            ),
                            style: AppTextStyles.subDescRegular,
                          )
                        : RichTextModel(
                            text: "processing...",
                            style: AppTextStyles.smallSubDescStyleLight
                                .copyWith(color: AppColors.orange),
                          )
                  ],
                ),
                SizedBox(height: AppDimens.dimen2),
                UiApi.richText(
                  mod: [
                    RichTextModel(
                      text: "Customer:  ",
                      style: AppTextStyles.smallerSubDescStyleLight,
                    ),
                    RichTextModel(
                      text: Utils.capitalizeLetter(
                          val: pay.redemption.personInfo.fullName.isEmpty
                              ? pay.redemption.personInfo.firstName
                              : pay.redemption.personInfo.fullName,
                          capAllFirstLetters: true),
                      style: AppTextStyles.smallerSubDescStyleRegular,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                UiApi.richText(
                  mod: [
                    RichTextModel(
                      text: "Reference:  ",
                      style: AppTextStyles.smallerSubDescStyleLight,
                    ),
                    pay.payments.isNotEmpty
                        ? RichTextModel(
                            text: '${model.reference}',
                            style: AppTextStyles.smallerSubDescStyleRegular,
                          )
                        : RichTextModel(
                            text: "processing...",
                            style: AppTextStyles.smallSubDescStyleLight
                                .copyWith(color: AppColors.orange),
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
                    pay.payments.isNotEmpty
                        ? RichTextModel(
                            text:
                                model.status.toUpperCase().replaceAll("_", " "),
                            style: AppTextStyles.smallerSubDescStyleSemiBold
                                .copyWith(
                                    color: Utils.getRedemptionStatusColor(
                                        model.status)),
                          )
                        : RichTextModel(
                            text: "processing...",
                            style: AppTextStyles.smallSubDescStyleLight
                                .copyWith(color: AppColors.orange),
                          )
                  ],
                ),
              ],
            )),
            if (model.status.toUpperCase() == 'PAID' &&
                printerType != PrinterType.NO_PRINTING)
              Flexible(
                flex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.print,
                      size: AppDimens.dimen20,
                    ),
                    SizedBox(height: AppDimens.dimen5),
                    Text(
                      DateTimeUtils.formatDateString(pay.createdAt,
                          format: "PRINT"),
                      style: AppTextStyles.smallerSubDescStyleRegular
                          .copyWith(color: AppColors.black),
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
