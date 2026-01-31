import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/data/enum/PrinterTypes.dart';
import 'package:prime_pay/data/model/local/ReceiptModel.dart';
import 'package:prime_pay/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrintingUtils {
  static const String PRINT_CHANNEL = "primepay.print.receipt";
  static const String RECEIPT_PATH = "assets/receipts/receipt.txt";
  static const platform = MethodChannel(PRINT_CHANNEL);
  String receiptContent = '';

  ///------- PRINTING METHODS --------------------------
  static const String PRINT_TEXT_METHOD = "print_text";
  static const String PRINT_IMAGE_METHOD = "print_image";

  ///------- PRINTER TYPE -----
  static const String PRINT_TYPE_METHOD = "print_type_method";
  static const String PRINT_TYPE = "print_type";

  ///------------ PRINTING ARGUMENTS -------------------
  static const String TEXT = "text";
  static const String TEXT_SIZE = "text_size";
  static const String TEXT_STYLE = "text_style";
  static const String TEXT_ALIGNMENT = "text_alignment";
  static const String IMAGE_RESOURCE = "image_resource";
  static const String IMAGE_ALIGNMENT = "image_alignment";

  ///------------- TEXT STYLES ---------------------
  static const int NORMAL = 0;
  static const int BOLD = 1;
  static const int ITALIC = 2;
  static const int BOLD_ITALIC = 3;

  ///--------------- PRINTING UTILS ----------------------
  static const String SUCCESS_MESSAGE = "success";
  static const String SEPARATOR = ".........................";

  ///--------------- PRINTING FONT SIZES --------------
  static const int SMALL_FONT_SIZE = 0;
  static const int NORMAL_FONT_SIZE = 1;
  static const int LARGE_FONT_SIZE = 2;

  ///------------- TEXT ALIGNMENT ---------------------
  static const int ALIGN_MIDDLE = 1;
  static const int ALIGN_RIGHT = 2;
  static const int ALIGN_LEFT = 0;

  static const String EMPTY_SPACE = '\n\n\n.';

  ///--------- IMAGE ALIGNMENT -----------------------
  static const int IMAGE_ALIGN_MIDDLE = 80;
  static const int IMAGE_ALIGN_RIGHT = 140;
  static const int IMAGE_ALIGN_LEFT = 0;

  Future<void> checkDeviceModelToSetUpPrinter() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      String model = '${androidInfo.model}';
      debugPrint("Model -->: $model");
      printerType = model.contains("Z91")
          ? PrinterType.Z91
          : model.contains("QUONSUO")
          ? PrinterType.QUONSUO_PDA
          : PrinterType.NO_PRINTING;

      try {
        await platform
            .invokeMethod(PRINT_TYPE_METHOD, {PRINT_TYPE: printerType.name});
      } on PlatformException catch (e) {
        print("Platform Exception ${e.message}");
      }
    }
  }

  ///Print the receipt together with logo of Prime Pay
  Future<void> prepareToPrint(ReceiptModel model) async {
    receiptContent = await _getFileData();
    String salutation = await getSalutation();

    model = model.copyWith(salutation: salutation);

    List<String> sal = salutation.split("#");

    //Print the prime logo first
    await _printImage();

    // await Future.delayed(const Duration(seconds: 2));

    //Print the Merchant Name
    await _printReceipt(
      '${model.merchantName}',
      align: ALIGN_MIDDLE,
      fontSize: NORMAL_FONT_SIZE,
      style: BOLD,
    );

    //  await Future.delayed(const Duration(seconds: 1));

    //Print the Merchant location
    await _printReceipt(
      '${model.merchantLocation ?? SEPARATOR}',
      align: ALIGN_MIDDLE,
      fontSize: NORMAL_FONT_SIZE,
      style: BOLD,
    );

    // await Future.delayed(const Duration(seconds: 1));

    //Print the Merchant location
    if (model.merchantLocation != null && model.merchantLocation!.isNotEmpty)
      await _printReceipt(
        SEPARATOR,
        align: ALIGN_MIDDLE,
        fontSize: NORMAL_FONT_SIZE,
        style: BOLD,
      );

    //Print the content of receipt
    await _printReceipt(
      _getReceiptContent(model),
      align: ALIGN_LEFT,
      fontSize: NORMAL_FONT_SIZE,
    );

    //Print the salutation
    for (String s in sal) {
      await _printReceipt(
        s,
        align: ALIGN_LEFT,
        fontSize: SMALL_FONT_SIZE,
        style: BOLD,
      );
    }

    await _printReceipt(EMPTY_SPACE);
  }

  /// Assumes the given path is a text-file-asset.
  Future<String> _getFileData() async {
    return await rootBundle.loadString(RECEIPT_PATH);
  }

  //Print Image
  Future<void> _printImage({int? imageResource}) async {
    try {
      await platform
          .invokeMethod(PRINT_IMAGE_METHOD, {IMAGE_RESOURCE: imageResource});
    } on PlatformException catch (e) {
      print("Platform Exception ${e.message}");
    }
  }

  //Print Text
  Future<void> _printReceipt(String content,
      {int align = ALIGN_LEFT,
      int style = NORMAL,
      int fontSize = NORMAL_FONT_SIZE}) async {
    try {
      await platform.invokeMethod(PRINT_TEXT_METHOD, {
        TEXT: content,
        TEXT_SIZE: fontSize,
        TEXT_ALIGNMENT: align,
        TEXT_STYLE: style,
      });
    } on PlatformException catch (e) {
      print("Platform Exception ${e.message}");
    }
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  String _getReceiptContent(ReceiptModel model) {
    String receipt = receiptContent;

    receipt = receipt.replaceAll(
        "#RECEIPT_NO#", model.receiptNo ?? '#${random(1000, 5000)}');

    if (model.disbursedAmount == null) {
      receipt = receipt.replaceAll(
          'Amount Disbursed: #CURRENCY# #DISBURSED_AMOUNT#\n', '');
    }
    if (model.redeemedAmount == null) {
      receipt = receipt.replaceAll(
          'Amount Redeemed: #CURRENCY# #REDEEMED_AMOUNT#\n', '');
    }
    if (model.attendant == null) {
      receipt = receipt.replaceAll('Attendant: #ATTENDANT#\n', '');
    }

    receipt = receipt.replaceAll(
        "#DISBURSED_AMOUNT#", model.disbursedAmount ?? 'N/A');
    receipt = receipt.replaceAll("#CURRENCY#", model.currency);

    receipt =
        receipt.replaceAll("#REDEEMED_AMOUNT#", model.redeemedAmount ?? 'N/A');
    receipt = receipt.replaceAll("#ATTENDANT#", model.attendant ?? 'N/A');
    receipt = receipt.replaceAll("#REFERENCE#", model.reference ?? 'N/A');
    receipt = receipt.replaceAll("#DATE#", model.date);
    receipt = receipt.replaceAll("#TIME#", model.time);
    receipt = receipt.replaceAll("#SALUTATION#", model.salutation ?? '');

    return receipt;
  }

  Future<String> getSalutation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? sal = pref.getString(PrefConstants.SALUTATION);
    return sal ?? "Thank you for transacting with Prime E-Gift.";
  }
}
