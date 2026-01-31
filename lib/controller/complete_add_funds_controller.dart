import 'dart:collection';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:prime_pay/api/ui_api.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/data_param.dart';
import 'package:prime_pay/data/model/local/web_model.dart';
import 'package:prime_pay/ui/base/base_web.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';

class CompleteAddFundsController extends BaseController {
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  String cardNumber = "";


  @override
  void setCurrentContext(BuildContext context) {
    super.setCurrentContext(context);
  }

  void setModel(DataParam model) {
    cardNumber = model.data.containsKey('purchase_code') ? model.data['purchase_code']: "";
  }

  ///Confirm you want to really do this deposit
  Future<void> confirmPayment() async {
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/card.png",
      title: "Proceed to Add Funds?",
      message: "Are you sure you want to add funds to your card?",
      buttonTitle: "Proceed",
      callBack: () {
        addFundsRequest();
      },
    );
  }

  ///Init a request to deposit money onto the 16-digit code
  Future<void> addFundsRequest() async {
    HashMap<String, Object> param = HashMap();
    param.putIfAbsent("amount", () => amountCtrl.text.trim());
    param.putIfAbsent("payment_to", () => "SELF");
    param.putIfAbsent("telephone", () => phoneCtrl.text.trim());
    param.putIfAbsent("purchase_code", () => cardNumber);

    LoaderWidget().showProgressIndicator(context: context);
    await webService.addFunds(param, (resp) {
      LoaderWidget().hideProgress();
      navUtils.fireTarget(BaseWebView(),
          model: WebModel(
            url: resp.data.paymentUrl,
            onDoneOnclick: () {
              navUtils.fireTargetOff(MainLandingScreen());
            },
          ));
    });
  }
}
