import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Timer startTimer(int time, Function? onclick, {Duration? duration}) {
    List<int> list = [];
    var oneSec = duration ?? const Duration(seconds: 1);
    return Timer.periodic(oneSec, (Timer t) {
      list.add(oneSec.inHours);
      print("Timer Loading ${list.length} == $time");
      if (list.length == time) {
        t.cancel();
        t.cancel();
        if (onclick != null) {
          onclick();
        }
      }
    });
  }

  ///Format phone number and remove + from number
  static String formatPhoneNumber(String phone, {String phoneCode = "233"}) {
    if (phone.isEmpty || phone.length < 9) {
      return phone;
    }

    phoneCode = phoneCode.replaceAll("+", "");
    phone = phone.replaceAll("+", "").replaceAll(" ", "");

    if (phone.length == 10 && phone.startsWith("0")) {
      return phoneCode + phone.substring(1, phone.length).trim();
    }

    return phone.replaceAll("+", "").trim();
  }

  static String moneyFormat(String price, {int precision = 0}) {
    if (price.isEmpty) {
      return "0.00";
    }

    var value = price;
    double p = parseDouble(price);
    value = p.toStringAsFixed(precision);

    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return "$value";
  }

  static String moneyFormatDouble(double price) {
    if (price == 0.0) {
      return "0.00";
    }

    var value = price.toStringAsFixed(3);

    if (price.toString().length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return "$value";
  }

  static double parseDouble(String amount) {
    double value = 0.0;
    try {
      value = double.parse(amount);
    } catch (e) {
      print("Error $e");
    }
    return value;
  }

  static int parseInt(String source) {
    int value = 0;
    try {
      value = int.parse(source);
    } catch (e) {
      print("Error $e");
    }
    return value;
  }

  static String capitalizeLetter({
    String? val,
    bool? capOnlyFirstLetter,
    bool? capAllFirstLetters,
    bool caps = true,
  }) {
    if (val == null || val.isEmpty) {
      return "";
    }

    if (caps && capAllFirstLetters == null && capOnlyFirstLetter == null) {
      return val.toUpperCase();
    }

    if (caps && capOnlyFirstLetter == true) {
      return val.capitalizeFirst ?? "";
    }

    if (caps && capAllFirstLetters == true) {
      var buffer = StringBuffer();
      List<String> arr = val.trim().replaceAll("  ", " ").split(" ");
      for (String s in arr) {
        if (s.isNotEmpty) {
          buffer.write(s.capitalizeFirst);
          buffer.write(" ");
        }
      }
      return buffer.toString();
    }

    return val;
  }

  static String parseIntMoney(String source) {
    int value = 0;
    try {
      if (!source.contains(".")) {
        value = parseInt(source);
      } else {
        int index = source.indexOf(".");
        String temp = source.replaceAll(".", "");
        value = parseInt(temp);

        if (value == 0) {
          //return "0";
        }

        print("SRC $source == IND $index == TEM $temp == VSL $value");

        List<String> list = temp.split("");
        int i = 0;
        temp = "";
        for (String str in list) {
          temp = temp + str;
          if (i == index - 1) {
            temp = temp + ".";
          }
          i++;
        }
        return "$temp";
      }
    } catch (e) {
      print("Error $e");
    }
    return "$value";
  }

  DateTime convertDateFromString(String strDate) {
    return DateTime.parse(strDate);
  }

  static void saveResponse(String key, Object response) async {
    final userDetails = convertEncode(response);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, userDetails);
    print("Saved data == $userDetails");
  }

  static Object getSavedObject(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String json = pref.getString(key) ?? "";
    if (json.isNotEmpty) {
      var jsonResponse = convert.jsonDecode(json);
      return jsonResponse;
    } else {
      return "";
    }
  }

  /// Converts [value] to a JSON string.
  ///
  /// If value contains objects that are not directly encodable to a JSON
  /// string (a value that is not a number, boolean, string, null, list or a map
  /// with string keys), the [toEncodable] function is used to convert it to an
  /// object that must be directly encodable.
  ///
  /// If [toEncodable] is omitted, it defaults to a function that returns the
  /// result of calling `.toJson()` on the unencodable object.
  ///
  /// Throws a JsonEncodingError if [value] results impossible to encode.
  static String convertEncode(Object value) {
    try {
      return json.encode(value);
    } catch (e) {
      print(e);
      return "";
    }
  }

  static Color getRedemptionStatusColor(String status) {
    switch (status.toUpperCase()) {
      case "PROCESSING":
        return AppColors.kYellowDeepColor;
      case "INITIATED":
        return AppColors.kYellowDeepColor;
      case "WAITING_CALLBACK":
        return AppColors.kYellowDeepColor;
      case "FAILED":
        return AppColors.red;
      case "UNPAID":
        return AppColors.orange;
      case "PAID":
        return AppColors.primaryGreenColor;
      default:
        return AppColors.nearlyDarkBlue;
    }
  }
}
