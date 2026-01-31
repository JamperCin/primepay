import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/ui_api.dart';
import 'package:prime_pay/ui/utils/PrintingUtils.dart';

import '../data/model/local/MerchantDetails.dart';
import '../data/model/local/ReceiptModel.dart';
import '../data/model/local/disbursement_model.dart';
import '../http/AppBaseResponse.dart';
import '../ui/utils/date_time_utils.dart';
import '../ui/utils/number_utils.dart';
import 'BaseController.dart';

class DisbursementController extends BaseController {
  RxList<DisbursementModel> filteredList = RxList<DisbursementModel>();
  RxList<DisbursementModel> mainRedemptionList = RxList<DisbursementModel>();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  int page = 1;
  RxBool isDoneLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  bool hasStartedApiCall = false;
  bool isPrinting = false;

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
          fetchDisbursementHistory();
        }
      }
    });
  }

  Future<void> fetchDisbursementHistory({bool pullToRefresh = false}) async {
    isLoadingMore.value = false;
    if (page == 1) {
      if (!pullToRefresh) {
        mainRedemptionList.clear();
        filteredList.clear();
        isDoneLoading.value = false;
      }
    } else {
      isLoadingMore.value = true;
    }

    page = pullToRefresh ? 1 : page;

    await webService.fetchDisbursement(page, (response) {
      handleApiResponse(response, pullToRefresh);
    });
  }

  void handleApiResponse(AppBaseResponse response, bool pullToRefresh) {
    if (page == 1) {
      isDoneLoading.value = true;
    } else {
      isLoadingMore.value = false;
    }

    if (pullToRefresh) {
      mainRedemptionList.clear();
      filteredList.clear();
    }

    if (response.data.disbursements.isEmpty) {
      return;
    }

    mainRedemptionList.addAll(response.data.disbursements.where(
        (element) => element.redemption.transactionType == 'card_redemption'));

    filteredList.clear();
    filteredList.addAll(mainRedemptionList);
  }

  ///Perform search on the list of cards on the home screen
  void onSearchOffline(String val) {
    filteredList.clear();
    if (val.isEmpty) {
      filteredList.addAll(mainRedemptionList);
    } else {
      List<DisbursementModel> model = mainRedemptionList
          .where((DisbursementModel e) =>
              e.payments.first.amount.contains(val) ||
              e.payments.first.status.toLowerCase().contains(val) ||
              e.payments.first.createdAt.contains(val) ||
              e.redemption.personInfo.fullName.toLowerCase().contains(val))
          .toList();
      filteredList.addAll(model);
    }
  }

  void confirmPrinting(DisbursementModel pay) {
    if (pay.payments.first.status.toUpperCase() != 'PAID' || isPrinting) {
      return;
    }

    ///Confirm to print receipt
    UiApi.showConfirmDialog(
        title: 'Confirm Receipt Printing',
        message: "Are you sure you want to print this receipt",
        callBack: () {
          prepareForReceiptPrinting(pay);
        });
  }

  ///------------------ PRINT RECEIPT -------------------
  ///This is basically for printing on POS
  Future<void> prepareForReceiptPrinting(DisbursementModel pay) async {
    isPrinting = true;

    MerchantDetails? merchant = getMerchant();
    PrintingUtils utils = PrintingUtils();
    utils.prepareToPrint(ReceiptModel(
      merchantName: '${merchant?.name ?? pay.merchantName}'.toUpperCase(),
      disbursedAmount:
          NumberUtils.moneyFormat(pay.payments.first.amount, decPlace: 2),
      redeemedAmount:
          NumberUtils.moneyFormat(pay.redemption.redemptionAmount, decPlace: 2),
      date: DateTimeUtils.formatDateString(pay.payments.first.createdAt,
          format: 'EEE dd MMM, yyyy'),
      time: DateTimeUtils.formatDateString(pay.payments.first.createdAt,
          format: 'hh:mm aa'),
      currency: 'GHS',
      reference: pay.payments.first.reference,
      merchantLocation: '${merchant?.branch ?? ''}\n${merchant?.address ?? ''}',
    ));

    await Future.delayed(const Duration(seconds: 10));

    print("Reset print");
    isPrinting = false;
  }
}
