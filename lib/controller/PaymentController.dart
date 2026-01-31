import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/Account.dart';
import 'package:prime_pay/data/model/local/Data.dart';
import 'package:prime_pay/data/model/local/PrimeCardModel.dart';
import 'package:prime_pay/data/model/local/data_param.dart';
import 'package:prime_pay/http/AppBaseResponse.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';
import 'package:prime_pay/ui/dashboard/entry/PinVerificationScreen.dart';
import 'package:prime_pay/ui/dashboard/fund_card/complete_add_fund_screens.dart';
import 'package:prime_pay/ui/dashboard/scanqr/CardDetailsScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/ScanQrCodeScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/SuccessScreen.dart';
import 'package:prime_pay/ui/utils/Utils.dart';

import '../data/model/local/MerchantDetails.dart';
import '../main.dart';
import 'PinController.dart';

class PaymentController extends BaseController {
  RxBool isLoadingPayment = false.obs;
  RxString pinSuccessMessage = "".obs;
  RxString partialDescription = "Enter Amount to Redeem".obs;
  RxString errorText = "".obs;
  RxBool isChecked = false.obs;
  RxBool isFormValid = true.obs;
  DataParam? dataParam;

  void setParam(DataParam? param) {
    dataParam = param;
  }

  ///QrCode Controller
  // QRViewController? controller;

  ///This holds the value for the scanned QR-Code
  ///A 16 digit code from the Qr-Code
  String card16DigitCode = "";
  String amountToPay = "";

  ///Holder of Card Details
  PrimeCardModel? primeCardModel;
  Account? cardAccount;

  TextEditingController cardNumberTextController = TextEditingController();
  FocusNode cardFocusNode = FocusNode();

  List<TextEditingController> pinList = [];

  TextEditingController amountTextController = TextEditingController();
  RxString amountText = "0".obs;
  FocusNode amountFocusNode = FocusNode();
  MerchantDetails? currentMerchant;

  @override
  void onInit() {
    super.onInit();

    initWidgets();

    cardFocusNode = FocusNode();
    amountFocusNode = FocusNode();

    cardNumberTextController = TextEditingController();
    amountTextController = TextEditingController();

    isLoadingPayment = false.obs;

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

  void verifySecurityPin() {
    String code = "";
    String securityPin =
        preference?.getString(PrefConstants.SECURITY_PIN) ?? "";
    securityPin = "1234";

    for (TextEditingController t in pinList) {
      code = code + t.text;
    }

    if (code.length != 4) {
      pinSuccessMessage.value =
          "Invalid security pin. Please enter a valid pin";
      return;
    } else if (code != securityPin) {
      pinSuccessMessage.value = "Wrong security pin entered. Please try again";
      return;
    }

    Get.back();
  }

  void clearPin() {
    pinSuccessMessage.value = "";
    for (TextEditingController t in pinList) {
      t.text = "";
    }
  }

  void onScanOnClick() {
    Get.to(ScanQrCodeScreen());
  }

  bool isValidRedemption(bool isCodeFromQrScan) {
    if (isCodeFromQrScan) {
      if (Utils.parseDouble(amountToPay) >
          Utils.parseDouble(cardAccount?.currentBalance ?? "0.0")) {
        widgetUtils.showErrorSnackBar(
            "This amount cannot be redeemed. Balance on card is less than specified amount.");

        return false;
      } else if (Utils.parseDouble(amountToPay) == 0) {
        widgetUtils.showErrorSnackBar("This amount cannot be redeemed.");

        return false;
      }

      return true;
    }

    amountToPay = getStringData(amountTextController);

    if (getStringData(amountTextController).isEmpty) {
      errorText.value = "Kindly enter an amount.";
      widgetUtils.showErrorSnackBar(errorText.value);
      return false;
    }

    if (Utils.parseDouble(amountToPay) == 0) {
      errorText.value = "Enter a valid amount.";
      widgetUtils.showErrorSnackBar(errorText.value);
      return false;
    }

    errorText.value = "";
    return true;
  }

  void confirmCardRedeem(bool isCodeFromQrScan) {
    if (isValidRedemption(isCodeFromQrScan)) {
      if (isCodeFromQrScan) {
        popUpConfirmDialog(
            title: "Redeem Card?",
            message: "Are you sure you want to proceed to redeem card?",
            imageAsset: "assets/images/gifted_card.jpg",
            color: AppColors.white,
            buttonTitle: "Redeem",
            callBack: () {
              isLoadingPayment.value = true;
              initCardRedeem();
            });
      } else {
        //goToVerificationScreen();
        sendVerificationCode(onDone: () {
          goToVerificationScreen();
        });
      }
    }
  }

  void goToVerificationScreen() {
    PinController controller = Get.put(PinController());
    controller.clearPin();
    Get.to(() => PinVerificationScreen(
          controller: controller,
          card16DigitCode: card16DigitCode,
          amountToPay: amountToPay,
          title: "Verify SMS Code",
          appBarTitle: "Verification",
          message:
              "A 6-digit code has been sent to the customer's phone number for verification.",
          buttonText: "Verify",
          successCallBack: (pin) {
            isLoadingPayment.value = true;
            initCardRedeem(confirmCode: pin);
          },
          onResendCode: () {
            sendVerificationCode();
          },
        ));
  }

  void initCardRedeem({String? confirmCode}) {
    if (card16DigitCode.isEmpty || (getMerchant()?.code ?? "").isEmpty) {
      widgetUtils.showErrorSnackBar(
          "Card details cannot be requested at the moment. Kindly try again later.");
      return;
    }

    HashMap<String, Object> params = new HashMap();
    params.putIfAbsent("account_code", () => card16DigitCode);
    params.putIfAbsent("merchant_code", () => getMerchant()?.code ?? "");
    params.putIfAbsent("amount", () => amountToPay);
    if (confirmCode != null) {
      params.putIfAbsent("confirmation_code", () => confirmCode);
    }

    webService.redeemCard(params, (response) {
      isLoadingPayment.value = false;

      if (response.success) {
        Get.offAll(SuccessScreen(
          title: "Card successfully Redeemed",
          message: "Your card has been successfully redeemed.",
          buttonText: 'Done',
          onDoneClick: () async {
            Get.offAll(MainLandingScreen());
          },
        ));
      } else {
        errorText.value = response.error ?? "";
      }
    });
  }

  void sendVerificationCode({Function? onDone}) {
    widgetUtils.showProgressBar();
    HashMap<String, Object> params = new HashMap();
    params.putIfAbsent("account_code", () => card16DigitCode);

    webService.sendRedeemVerificationCode(params, (response) {
      if (onDone != null) {
        onDone();
      }

      widgetUtils.showSuccessSnackBar(
          "An SMS verification has been sent successfully to the owner of card.");
    });
  }

  void fetchCardDetails(Function(AppBaseResponse) callBack) {
    if (card16DigitCode.isEmpty) {
      widgetUtils.showErrorSnackBar(
          "Card details cannot be requested at the moment. Kindly try again later.");
      return;
    }

    webService.fetchCardDetails(card16DigitCode, (response) {
      callBack(response);
    });
  }

  bool _isCodeFromQrScan = false;

  void goToCardDetails({String? data}) {
    _isCodeFromQrScan = data != null;
    this.card16DigitCode =
        data == null ? getStringData(cardNumberTextController) : _getCode(data);

    if (dataParam != null && dataParam?.data != null) {
      navUtils.fireTarget(CompleteAddFundsScreen(),
          model: DataParam(data: {"purchase_code": card16DigitCode}));
    } else {
      Get.to(() => CardDetailsScreen(isCodeFromQrScan: _isCodeFromQrScan));
    }
  }

  String _getCode(String data) {
    if (data.contains("#")) {
      var d = data.split("#");
      if (d.length > 0) {
        card16DigitCode = d[0];
      }

      if (d.length > 1) {
        amountToPay = d[1];
      }
      return card16DigitCode;
    }

    if (data.contains("https") && data.length > 16) {
      int length = data.length;
      card16DigitCode = data.substring(length - 16, length);
      amountToPay = "0.0";
      _isCodeFromQrScan = false; //Force the ui to where user will enter amount
      return card16DigitCode;
    }

    return data;
  }
}
