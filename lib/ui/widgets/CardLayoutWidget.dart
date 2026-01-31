import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';

class CardLayoutWidget extends StatelessWidget {
  final Widget? child;
  final Color cardBackground;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  EdgeInsetsGeometry? padding;
  final double elevation;
  final double? height;
  final double? width;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Function? onclick;

  CardLayoutWidget({
    this.child,
    this.cardBackground = AppColors.white,
    this.borderColor = AppColors.white,
    this.margin = const EdgeInsets.all(0),
    this.padding,
    this.borderRadius = 10,
    this.onclick,
    this.width,
    this.height,
    this.elevation = 5,
    this.minHeight = 10,
    this.minWidth = 10,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    padding =
        padding == null ? EdgeInsets.all(AppDimens.smallSubDesc) : padding;
    return GestureDetector(
      onTap: () {
        if (onclick != null) onclick!();
      },
      child: Card(
        margin: margin,
        elevation: elevation,
        child: Container(
          width: width,
          height: height,
          /* constraints: BoxConstraints(
              minHeight: minHeight,
              minWidth: minWidth,
              maxHeight: maxHeight,
              maxWidth: maxWidth),*/
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: cardBackground,
            boxShadow: [
              BoxShadow(color: cardBackground, spreadRadius: 2),
            ],
            border: Border.all(color: borderColor),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
