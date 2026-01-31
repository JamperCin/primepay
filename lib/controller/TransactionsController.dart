import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/MerchantDetails.dart';
import 'package:prime_pay/data/model/local/ReceiptModel.dart';
import 'package:prime_pay/ui/utils/PrintingUtils.dart';
import 'package:prime_pay/ui/utils/date_time_utils.dart';
import 'package:prime_pay/ui/utils/number_utils.dart';

import '../data/model/local/redemptions_model.dart';
import '../http/AppBaseResponse.dart';

class TransactionsController extends BaseController {
  RxList<RedemptionsModel> filteredList = RxList<RedemptionsModel>();
  RxList<RedemptionsModel> mainRedemptionList = RxList<RedemptionsModel>();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int page = 1;
  RxBool isDoneLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;

  @override
  void onInit() {
    super.onInit();
    initWidgets();
    listenToScroll();
  }

  ///Listen to scrolling of listview
  void listenToScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          page++;
          fetchRedemptionHistory();
        }
      }
    });
  }

  void fetchRedemptionHistory() {
    if (page == 1) {
      mainRedemptionList.clear();
      filteredList.clear();
      isDoneLoading.value = false;
    } else {
      isLoadingMore.value = true;
    }

    webService.fetchRedemptions(page, (response) {
      handleApiResponse(response);
    });
  }

  void handleApiResponse(AppBaseResponse response) {
    if (page == 1) {
      isDoneLoading.value = true;
    } else {
      isLoadingMore.value = false;
    }

    mainRedemptionList.addAll(response.data.redemptions);
    filteredList.addAll(response.data.redemptions);
  }

  ///------------------ PRINT RECEIPT -------------------
  ///This is basically for printing on POS
  Future<void> prepareForReceiptPrinting(RedemptionsModel pay) async {
    MerchantDetails? merchant = getMerchant();
    PrintingUtils utils = PrintingUtils();
    utils.prepareToPrint(ReceiptModel(
      merchantName: '${merchant?.name ?? pay.merchant}'.toUpperCase(),
      redeemedAmount: NumberUtils.moneyFormat(pay.amount, decPlace: 2),
      date: DateTimeUtils.formatDateString(pay.createdAt,
          format: 'EEE dd MMM, YYYY'),
      time: DateTimeUtils.formatDateString(pay.createdAt, format: 'hh:mm aa'),
      currency: 'GHS',
      attendant: 'N/A',
      merchantLocation: '${merchant?.branch ?? ''}\n${merchant?.address ?? ''}',
    ));
  }
}
