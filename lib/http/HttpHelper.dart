import 'dart:collection';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/controller/BaseController.dart';

import 'AppBaseResponse.dart';
import 'ResponseCodes.dart';

class HttpHelper {
  BaseController controller = Get.put(BaseController());
  final List<String> EXCEPTION_URL = [
    "prime.sika/v1/users/login",
    "prime.sika/v1/users/logout",
  ];

  HttpHelper getClient() {
    return new HttpHelper();
  }

  HashMap<String, Object> params(String key, Object object) {
    if (object is int || object is bool) {
      object = "$object";
    }

    HashMap<String, Object> params = HashMap();
    params.putIfAbsent(key, () => object);
    return params;
  }

  Future<http.Response> post(uri,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(uri, requestType: "POST", headers: headers, params: body);
    return http.post(uri, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> get(url,
      {Map<String, String> headers = const {}}) async {
    printLogs(url, requestType: "GET", headers: headers);
    return http.get(url, headers: headers);
  }

  Future<http.Response> put(url,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(url, requestType: "PUT", headers: headers, params: body);
    return http.put(url, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> delete(url,
      {Map<String, String> headers = const {},
      body,
      Encoding? encoding}) async {
    printLogs(url, requestType: "DELETE", headers: headers, params: body);
    return http.delete(url, body: body, encoding: encoding, headers: headers);
  }

  Future<http.Response> getClientGET(url,
      {Map<String, String> headers = const {},
      Map<String, Object>? params}) async {
    var uri = buildUrl(url, body: params);

    printLogs(uri, requestType: "GET", headers: headers, params: params);
    return http.get(uri, headers: headers);
  }

  Uri buildUrl(String url, {dynamic body}) {
    return Uri(
      scheme: 'https',
      host: AppStrings.HOST,
      path: url.replaceAll("?", ""),
      queryParameters: body,
    );
  }

  void printLogs(
    uri, {
    String? requestType,
    Map<String, String>? headers,
    dynamic params,
  }) {
    print(
        "\n\n$requestType REQUEST: $uri\nHEADERS: $headers\nBODY: $params\n\n");
  }

  String getPlatformAccess() {
    return /*controller.platformAccess != null &&
            controller.platformAccess.isNotEmpty
        ? controller.platformAccess
        :*/
        "pCweb";
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = Map();
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "application/json");
    return headers;
  }

  Map<String, String> getTokenHeaders() {
    Map<String, String> headers = Map();
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "application/json");
    headers.putIfAbsent("Authorization", () => controller.getToken());
    return headers;
  }

  Map<String, String> getMultiPartTokenHeaders() {
    Map<String, String> headers = Map();
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "multipart/form-data");
    headers.putIfAbsent("Authorization", () => controller.getToken());
    return headers;
  }

  Map<String, String> getHeadersFormData() {
    Map<String, String> headers = Map();
    headers.putIfAbsent("da-secret", () => getPlatformAccess());
    headers.putIfAbsent("Authorization", () => controller.getToken());
    headers.putIfAbsent(
        "Content-Type", () => "application/x-www-form-urlencoded");
    return headers;
  }

  void serializeResponse(
    var response,
    Function(AppBaseResponse response) callback, {
    ///Should logs be printed tot he console together with the normal internal http logs
    bool shouldPrint = true,

    ///Should the snackBar display errors when there is an error
    bool shouldShowSnackBar = true,

    ///Should the snackBar display errors when there is an error in the background
    bool showSnackWhen401 = false,

    ///Should send callback method even if there is an error to the api
    Function(bool, String)? forceCallBack,

    ///Show custom error message to the user forgetting the error from backend
    String? errorMessage,
  }) {
    print("Log ${response.statusCode}");
    var responseMess = ResponseCodes.response(response.statusCode);

    try {
      var jsonResponse = convert.jsonDecode(response.body);
      if (shouldPrint) {
        try {
          print(" \n\nRESPONSE ${response.request.url}: \n$jsonResponse\n\n");
        } catch (e) {
          print("Failed to get response");
        }
      }
      AppBaseResponse baseResponse = AppBaseResponse.fromJson(jsonResponse);

      controller.widgetUtils.dismissProgressBar();

      if (baseResponse.success) {
        callback(baseResponse);
      } else if (401.isEqual(baseResponse.status)) {
        if (forceCallBack != null) {
          forceCallBack(false, baseResponse.error ?? responseMess);
        }
        if (!EXCEPTION_URL
            .contains(response.request.url.toString().trim().toLowerCase())) {
          controller.generateNewToken();
        }

        if (showSnackWhen401) {
          controller.showErrorSnackBar(
              errorMessage ?? baseResponse.error ?? responseMess);
        }
      } else {
        if (shouldShowSnackBar) {
          controller.showErrorSnackBar(
              errorMessage ?? baseResponse.error ?? responseMess);
        }

        if (forceCallBack != null) {
          forceCallBack(false, baseResponse.error ?? responseMess);
        }
      }
    } catch (e) {
      controller.widgetUtils.dismissProgressBar();
      print("Error exception: ${e.toString()}");

      if (shouldShowSnackBar) {
        controller.showErrorSnackBar(errorMessage ?? responseMess);
      }

      if (forceCallBack != null) {
        forceCallBack(false, errorMessage ?? responseMess);
      }
    }
  }
}
