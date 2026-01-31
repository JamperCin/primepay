import 'dart:collection';

import 'package:get/get.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/BankAccount.dart';
import 'package:prime_pay/data/model/local/companies.dart';
import 'package:prime_pay/ui/login/QuickLogin.dart';

import '../app/AppColors.dart';
import '../app/PrefConstants.dart';
import '../data/model/local/MerchantDetails.dart';
import '../http/WebService.dart';
import '../main.dart';
import '../ui/utils/Utils.dart';

class SettingsController extends BaseController {
  MerchantDetails? merchant;
  Rx<BankAccount> bankAccount = BankAccount().obs;
  RxBool isLoading = false.obs;

  onInit() {
    super.onInit();
    initWidgets();
    merchant = getMerchant();
    initGetBankAccount();

    getMerchantDetails();
  }

  void initGetBankAccount() {
    bankAccount.value = (merchant?.bankAccount ??
        ((merchant?.createdBy?.companies ?? <Companies>[]).isNotEmpty
            ? (merchant?.createdBy?.companies?.first.bankAccount ??
                BankAccount())
            : BankAccount()));
  }

  Future<void> getMerchantDetails() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));

    webService.getMerchantDetails((response) {
      isLoading.value = false;
      if (response.data.merchant.name.isNotEmpty) {
        merchant = response.data.merchant;
        initGetBankAccount();
        final details = Utils.convertEncode(response.data.merchant);
        logoUrl.value = response.data.merchant.logoUrl;
        preference?.setString(PrefConstants.MERCHANT_DETAILS, details);
        preference?.setString(
            PrefConstants.MERCHANT_CODE, response.data.merchant.code);
      }
    });
  }

  void onSignOutOnClick() {
    popUpConfirmDialog(
        imageAsset: "assets/images/sign_out.jpg",
        color: AppColors.white,
        title: "Sign Out",
        message: "Are you sure you want to sign out of Prime Pay?",
        callBack: () {
          initSignOutRequest();
        });
  }

  void initSignOutRequest() {
    widgetUtils.showProgressBar();
    HashMap<String, String> param = new HashMap();
    param.putIfAbsent("user_type", () => USER_TYPE);

    webService = new WebService();
    webService.signOut(param, (response) {
      if (!response.success) {
        forceLogOut();
      } else {
        pref.clearPreference();
        Get.offAll(QuickLogin());
      }
    });
  }

  void forceLogOut() {
    popUpConfirmDialog(
        imageAsset: "assets/images/sign_out.jpg",
        title: "Sign Out Failing?",
        buttonTitle: "Force Sign Out",
        color: AppColors.white,
        message:
            "Signing out of prime taking long or not working? You can force sign out of Prime eGift?",
        callBack: () {
          pref.clearPreference();
          Get.offAll(QuickLogin());
        });
  }

  String accountType() {
    return bankAccount.value.accountType == 'momo' ? 'Mobile Money' : 'Bank';
  }

  String accountNetwork() {
    return bankAccount.value.accountType == 'momo' ? 'Network' : 'Bank Name';
  }
}
