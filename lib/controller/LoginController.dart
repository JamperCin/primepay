import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/http/WebService.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';

import '../app/PrefConstants.dart';
import '../main.dart';
import 'BaseController.dart';

class LoginController extends BaseController {
  WebService webService = WebService();

  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isInitialised = false;

  RxBool rememberMe = true.obs;
  RxBool isProgressLoading = false.obs;

  @override
  void onInit() {
    webService = WebService();

    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    phoneTextController = new TextEditingController();
    passwordTextController = new TextEditingController();
    checkIfRememberMe();
    initWidgets();
    checkForAppUpdate();
    super.onInit();
  }

  void checkIfRememberMe() {
    rememberMe.value = pref.getBool(PrefConstants.REMEMBER_LOGIN, def: true);
  }

  void setRememberMe(bool value) {
    rememberMe.value = value;
  }

  bool isValidForm() {
    if (validationUtils.validateEntry(phoneTextController)) {
      return validationUtils.validateEntry(passwordTextController);
    }
    return false;
  }

  String getMerchantName() {
    return pref.getMerchant().name;
  }

  void initLoginRequest() {
    if (isValidForm()) {
      widgetUtils.showProgressBar();

      HashMap<String, String> params = new HashMap();
      params.putIfAbsent("forname", () => phoneTextController.text.trim());
      params.putIfAbsent("password", () => passwordTextController.text.trim());
      params.putIfAbsent("user_type", () => USER_TYPE);

      webService.login(params, (response) {
        pref.saveLoginDetails(params, response);
        preference?.setBool(PrefConstants.REMEMBER_LOGIN, rememberMe.value);
        Get.offAll(MainLandingScreen());
      });
    }
  }

  void initQuickLogin() {
    if (pref.getBool(PrefConstants.REMEMBER_LOGIN)) {
      String phone = pref.getString(PrefConstants.FOR_NAME);
      String password = pref.getString(PrefConstants.PASSWORD);
      if (phone.isEmpty || password.isEmpty) {
        showGeneralSnackBar(
            message:
                "Sorry Quick login is not possible at the moment. Kindly login");
        return;
      }

      isProgressLoading.value = true;
      HashMap<String, String> params = new HashMap();
      params.putIfAbsent("forname", () => phone);
      params.putIfAbsent("password", () => password);
      params.putIfAbsent("user_type", () => USER_TYPE);

      webService.login(
        params,
        (response) {
          isProgressLoading.value = false;
          if (response.success) {
            pref.saveLoginDetails(params, response);
            Get.offAll(MainLandingScreen());
          }
        },
        forceCallback: true,
      );
    } else {
      showGeneralSnackBar(
          message: "Sorry Quick login is not possible at the moment. "
              "Kindly login again and make sure to check Remember Me checkbox.");
    }
  }
}
