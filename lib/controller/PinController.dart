import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/MerchantDetails.dart';
import 'package:prime_pay/main.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/SuccessScreen.dart';
import 'package:prime_pay/ui/utils/Utils.dart';

class PinController extends BaseController {
  String card16DigitCode = "";
  String amountToPay = "";

  RxBool isLoadingPayment = false.obs;
  RxString pinCode = "".obs;

  MerchantDetails? currentMerchant;

  @override
  void onInit() {
    super.onInit();
    initWidgets();
    getMerchantDetails();
  }

  void getMerchantDetails() {
    webService.getMerchantDetails((response) {
      if (response.data.merchant.name.isNotEmpty) {
        currentMerchant = response.data.merchant;
        final details = Utils.convertEncode(response.data.merchant);
        logoUrl.value = response.data.merchant.logoUrl;
        preference?.setString(PrefConstants.MERCHANT_DETAILS, details);
        preference?.setString(
            PrefConstants.MERCHANT_CODE, response.data.merchant.code);
      }
    });
  }

  void verifySecurityPin({Function(String)? successCallBack}) {
    if (pinCode.value.length != 6) {
      showErrorSnackBar(
          "Invalid verification code entered. Please enter a valid code");
      return;
    }

    if (successCallBack != null) {
      successCallBack(pinCode.value);
      clearPin();
    }
  }

  void clearPin() {
    pinCode.value = "";
  }

  void sendVerificationCode(BuildContext context) {
    widgetUtils.showProgressBar();
    HashMap<String, Object> params = new HashMap();
    params.putIfAbsent("account_code", () => card16DigitCode);

    webService.sendRedeemVerificationCode(params, (response) {
      widgetUtils.showSuccessSnackBar(
          "An SMS verification has been sent successfully to the owner of card.");
    });
  }

  void onPinEntered(String confirmCode) {
    String merchantCode =
        preference?.getString(PrefConstants.MERCHANT_CODE) ?? "";
    if (card16DigitCode.isEmpty) {
      widgetUtils.showErrorSnackBar(
          "Card details cannot be requested at the moment. Kindly try again later.");
      return;
    }

    widgetUtils.showProgressBar();

    HashMap<String, Object> params = new HashMap();
    params.putIfAbsent("account_code", () => card16DigitCode);
    params.putIfAbsent("merchant_code", () => merchantCode);
    params.putIfAbsent("amount", () => amountToPay);
    params.putIfAbsent("confirmation_code", () => confirmCode);

    webService.redeemCard(params, (response) {
      if (response.success) {
        Get.offAll(SuccessScreen(
          title: "Card successfully Redeemed",
          message: "Your card has been successfully redeemed.",
          buttonText: 'Done',
          onDoneClick: () async {
            // await prepareForReceiptPrinting();
            Get.offAll(MainLandingScreen());
          },
        ));
      } else {
        widgetUtils.showErrorSnackBar(
            response.error ?? "An error occurred. Please try again later");
      }
    });
  }

  ///------------------ PRINT RECEIPT -------------------
  ///This is basically for printing on POS
  // Future<void> prepareForReceiptPrinting() async {
  //   MerchantDetails? merchant = currentMerchant ?? getMerchant();
  //   PrintingUtils utils = PrintingUtils();
  //   utils.prepareToPrint(ReceiptModel(
  //     merchantName: '${merchant?.name ?? 'N/A'}'.toUpperCase(),
  //     redeemedAmount: NumberUtils.moneyFormat(amountToPay, decPlace: 2),
  //     // reference: 'dh63879392',
  //     date: DateTimeUtils.getCurrentDate(format: 'EEE dd MMM, YYYY'),
  //     time: DateTimeUtils.getCurrentDate(format: 'hh:mm aa'),
  //     currency: 'GHS',
  //     attendant: 'N/A',
  //     merchantLocation: '${merchant?.branch ?? ''}\n${merchant?.address ?? ''}',
  //   ));
  // }
}
