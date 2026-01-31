import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:prime_pay/controller/add_funds_controller.dart';


class FundCardScreen extends BaseScreenStandard {
  final _controller = Get.put(AddFundsController());

  @override
  String appBarTitle() {
    return "Add Funds";
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.surfaceBright;
  }

  // @override
  // TextStyle? appBarTitleStyle(BuildContext context) {
  //   return textTheme.bodyMedium;
  // }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.dp(), vertical: 20.dp()),
      child: Column(
        children: [
          Center(
              child: AssetImageWidget(
                asset: "assets/images/card.png",
                height: 200.dp(),
                width: 200.dp(),
              )),
          SizedBox(height: 20.dp()),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "This feature enables users to fund their",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text: " physical gift cards ",
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.primary),
                ),
                TextSpan(
                  text: "purchased from their merchant. "
                      "Users can load any desired amount onto this physical card.",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text: "\n\n",
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text:
                  "You can fund your physical prime gift card using any of the below options.",
                  style: textTheme.labelSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 70.dp()),
          ButtonWidget(
            onTap: _controller.onScanQrCode,
           // height: 60.dp(),
            text: "Scan QR Code",
            asset: "assets/images/scan.png",
          ),
          SizedBox(height: 30.dp()),
          ButtonWidget(
           // height: 60.dp(),
            onTap: _controller.onEnterCardDigit,
            text: "Enter 16-Digit Of Card",
            asset: "assets/images/input_card.png",
            backgroundColor: colorScheme.inverseSurface,
          ),
        ],
      ),
    );
  }
}
