import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';

class IntroModel {
  String? imageAsset;
  String? title;
  String? message;
  String? bgAsset;
  Color? color;
  Color textColor;
  bool showBgAsset;

  IntroModel({
    this.imageAsset,
    this.title,
    this.message,
    this.bgAsset,
    this.color,
    this.textColor = AppColors.black,
    this.showBgAsset = true,
  });
}
