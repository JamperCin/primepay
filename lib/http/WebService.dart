import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:prime_pay/app/PrefConstants.dart';

import '../main.dart';
import 'ApiClient.dart';
import 'AppBaseResponse.dart';
import 'HttpHelper.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class WebService extends ApiClient {
  late HttpHelper helper = HttpHelper();

  WebService() {
    HttpOverrides.global = MyHttpOverrides();
  }

  @override
  Future<void> login(HashMap<String, Object> params,
      Function(AppBaseResponse response) callback,
      {bool forceCallback = false}) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/users/login?"),
        body: jsonEncode(params),
        headers: helper.getHeaders());
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      errorMessage: "Wrong phone number or password entered.",
      forceCallBack: (success, error) {
        if (!success && forceCallback) {
          AppBaseResponse res =
              new AppBaseResponse(success: false, error: error);
          callback(res);
        }
      },
    );
  }

  @override
  Future<void> getMerchantDetails(
      Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().get(
        helper.buildUrl("prime.sika/v1/merchant-accounts/detail-info?"),
        headers: helper.getTokenHeaders());
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> signOut(HashMap<String, Object> params,
      Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().post(
        helper.buildUrl("prime.sika/v1/users/logout?"),
        body: jsonEncode(params),
        headers: helper.getTokenHeaders());

    helper.serializeResponse(response, callback, showSnackWhen401: true,
        forceCallBack: (success, mess) {
      if (!success) {
        callback(AppBaseResponse());
      }
    });
  }

  @override
  Future<void> redeemCard(HashMap<String, Object> params,
      Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl("prime.sika/v1/accounts/customer/redeem?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> sendRedeemVerificationCode(HashMap<String, Object> params,
      Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().post(
          helper.buildUrl(
              "prime.sika/v1/accounts/merchant/send-confirmation-code?"),
          headers: helper.getTokenHeaders(),
          body: jsonEncode(params),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
    );
  }

  @override
  Future<void> fetchCardDetails(
      String params, Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().get(
          helper.buildUrl("/prime.sika/v1/accounts/merchant/$params"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, mess) {
      if (!isSuccess) {
        AppBaseResponse res = new AppBaseResponse(success: false, error: mess);
        callback(res);
      }
    });
  }

  @override
  Future<void> fetchDisbursement(
      int page, Function(AppBaseResponse response) callback) async {
    HashMap<String, String> param = HashMap();
    param.putIfAbsent('page', () => '$page');
    param.putIfAbsent('limit', () => '20');
    param.putIfAbsent('merchant_code',
        () => "${preference?.getString(PrefConstants.MERCHANT_CODE)}");

    var response = await helper.getClient().getClientGET(
          '/prime.sika/v1/merchant-accounts/disbursements?',
          headers: helper.getTokenHeaders(),
          params: param,
        );
    helper.serializeResponse(response, callback, shouldShowSnackBar: false,
        forceCallBack: (isSuccess, mess) {
      if (!isSuccess) {
        AppBaseResponse res = new AppBaseResponse(success: false, error: mess);
        callback(res);
      }
    });
  }

  @override
  Future<void> fetchRedemptions(
      int page, Function(AppBaseResponse response) callback) async {
    HashMap<String, String> param = HashMap();
    param.putIfAbsent('page', () => '$page');
    param.putIfAbsent('limit', () => '20');
    param.putIfAbsent('merchant_code',
        () => "${preference?.getString(PrefConstants.MERCHANT_CODE)}");

    var response = await helper.getClient().getClientGET(
          'prime.sika/v1/merchant-accounts/redemptions?',
          headers: helper.getTokenHeaders(),
          params: param,
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }

  @override
  Future<void> addFunds(
      HashMap<String, Object> param, Function(AppBaseResponse p1) callback) async{
    var response = await helper.getClient().post(
      helper.buildUrl(
          "prime.sika/v1/physical/card/payments/customer?"),
      headers: helper.getTokenHeaders(),
      body: jsonEncode(param),
    );

    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: true,
      shouldShowSnackBar: true,
      shouldPrint: true,
    );
    // return apiCallPost(
    //   url: 'prime.sika/v1/physical/card/payments/customer',//'prime.sika/v1/add-funds?',
    //   callback: callback,
    //   showProgressBar: true,
    //   param: param,shouldPrint: true,
    // );
  }

  ///SAMPLE META FOR APP UPDATE
  ///   {
  ///             "ios": {
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed cart not loading.\n- Added update profile\n- Added feature to gift cards with messages and date\n- Added easy login with PIN or Touch ID/Face ID\n- Remoulded cards ui for better experience\n- Resolved filters on cards and promotional cards",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 7
  ///             },
  ///             "android": {
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed cart not loading.\n- Added update profile\n- Added feature to gift cards with messages and date\n- Added easy login with PIN or Touch ID/Face ID\n- Remoulded cards ui for better experience\n- Resolved filters on cards and promotional cards",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 5
  ///             },
  ///             "prime_pay":{
  ///                 "feature": "Improved performance and fixed various bugs.\n\nEnhanced the UI design for easy usage with the following added features:\n\n- Fixed card details not loading.",
  ///                 "forceUpdate": true,
  ///                 "versionCode": 7
  ///             }
  ///    }
  @override
  Future<void> checkAppUpdate(
      Function(AppBaseResponse response) callback) async {
    var response = await helper.getClient().get(
          helper.buildUrl("prime.sika/v1/mobile-app-version-meta?"),
          headers: helper.getTokenHeaders(),
        );
    helper.serializeResponse(
      response,
      callback,
      showSnackWhen401: false,
      shouldShowSnackBar: false,
    );
  }
}
