import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:prime_pay/controller/complete_add_funds_controller.dart';
import 'package:prime_pay/data/model/local/data_param.dart';



class CompleteAddFundsScreen extends BaseScreenStandard {
  final _controller = Get.put(CompleteAddFundsController());

  @override
  String appBarTitle() {
    return "Complete Add Funds";
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    _controller.setModel(baseObject as DataParam);
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    _controller.setCurrentContext(context);
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.surfaceBright;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 24.dp(),
        vertical: 20.dp(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: AssetImageWidget(
                asset: "assets/images/card.png",
                height: 200.dp(),
                width: 200.dp(),
              )),
          SizedBox(height: 20.dp()),
          Text(
            "Enter details below to fund the prime e-gift card.",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60.dp()),
          TextFieldWidget(
            prefixIcon: Icon(
              Icons.money,
              color: colorScheme.primary,
            ),
            labelText: "Enter Amount",
            hintText: "Eg: GHS 250",
            controller: _controller.amountCtrl,
            style: textTheme.bodyMedium,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10.dp()),
          TextFieldWidget.withPhoneNumber(
            labelText: "Enter telephone number of the owner of card",
            hintText: "Eg: 233  XXX XXX XXX",
            controller: _controller.phoneCtrl,
            style: textTheme.bodyMedium,
          ),
          SizedBox(height: 10.dp()),
        ],
      ),
    );
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return Container(
      child: ButtonWidget(
        text: 'Confirm',
        onTap: _controller.confirmPayment,
      ),

      padding: EdgeInsets.symmetric(
        horizontal: 16.dp(),
        vertical: 60.dp(),
      ),
    );
  }
}
