import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class NumberPad extends StatelessWidget {
  final String text;
  final Function(int)? onNumberClick;

  NumberPad({
    this.text = "0",
    this.onNumberClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onNumberClick != null) {
          onNumberClick!(int.parse(text));
        }
      },
      child: Text(
        text,
        style: AppTextStyles.descStyleRegular.copyWith(
          color: AppColors.white,
          fontSize: AppDimens.dimen32,
        ),
      ),
    );
  }
}
