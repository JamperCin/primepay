import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prime_pay,
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/ic_security_pin.png"),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.prime_pay,
        height: AppDimens.dimen150,
        child: Center(
          child: Text(
            "PRIME E-GIFT MERCHANT APP",
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleBold, AppColors.white),
          ),
        ),
      ),
    );
  }
}
