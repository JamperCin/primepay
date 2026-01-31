import 'dart:collection';
import 'dart:convert' as convert;

import 'package:prime_pay/data/model/local/MerchantDetails.dart';
import 'package:prime_pay/http/AppBaseResponse.dart';

import '../main.dart';
import 'PrefConstants.dart';

class AppSharedPreference {
  void clearPreference() async {
    String phone = getString(PrefConstants.FOR_NAME);
    String password = getString(PrefConstants.PASSWORD);
    // String merchant = getString(PrefConstants.MERCHANT_DETAILS);
    bool introShown = getBool(PrefConstants.IS_INTRO_SHOWN);
    bool rememberMe = getBool(PrefConstants.REMEMBER_LOGIN);

    preference?.clear();
    preference?.setString(PrefConstants.FOR_NAME, phone);
    preference?.setString(PrefConstants.PASSWORD, password);
    //preference?.setString(PrefConstants.MERCHANT_DETAILS, merchant);
    preference?.setBool(PrefConstants.IS_INTRO_SHOWN, introShown);
    preference?.setBool(PrefConstants.REMEMBER_LOGIN, rememberMe);
  }

  bool getBool(String key, {bool? def}) {
    return preference == null || preference?.getBool(key) == null
        ? def ?? false
        : (preference?.getBool(key))!;
  }

  String getString(String key) {
    return preference == null || preference?.getString(key) == null
        ? ""
        : (preference?.getString(key))!;
  }

  void saveLoginDetails(
      HashMap<String, String> params, AppBaseResponse response) async {
    // if (response == null) {
    //   return;
    // }
    preference?.setBool(PrefConstants.IS_LOGIN, true);

    preference?.setString(PrefConstants.TOKEN, response.data.token);
    preference?.setString(
        PrefConstants.PASSWORD, params[PrefConstants.PASSWORD] ?? "");
    preference?.setString(
        PrefConstants.FOR_NAME, params[PrefConstants.FOR_NAME] ?? "");
  }

  MerchantDetails getMerchant() {
    String mer = getString(PrefConstants.MERCHANT_DETAILS);
    if (mer.isNotEmpty) {
      var jsonResponse = convert.jsonDecode(mer);
      if (jsonResponse != null) {
        return MerchantDetails.fromJson(jsonResponse);
      }
    }
    return MerchantDetails();
  }
}
