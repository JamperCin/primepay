import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';
import 'package:prime_pay/ui/utils/WidgetUtils.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function()? onClick;
  final Color color;
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? widget;
  final double buttonRadius;
  final double elevation;

  RoundButton({
    this.text = "",
    this.onClick,
    this.textStyle,
    this.color = AppColors.darkerText,
    this.textColor = AppColors.white,
    this.widget,
    this.buttonRadius = 10,
    this.elevation = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * .8,
      height: AppDimens.dimen50,
      child: Container(
        decoration: WidgetUtils.deco(
          borderRadius: buttonRadius,
          opacity: 0.4,
          borderColor: color,
        ),
        child: TextButton(
          onPressed: () {
            if (onClick != null) {
              onClick!();
            }
          },
          child: widget ??
              Text(
                text,
                style: textStyle ??
                    AppTextStyles.descStyleBold.copyWith(
                      color: textColor,
                    ),
              ),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.grey,
            minimumSize: Size(SizeConfig.screenWidth * .75, AppDimens.dimen40),
            backgroundColor: color,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimen14,
              vertical: AppDimens.dimen12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
          ),
        ),
      ),
    );
    /*RaisedButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      child: widget == null
          ? Text(
              text,
              style: textStyle == null
                  ? AppTextStyles.getStyle(
                      AppTextStyles.descStyleRegular, textColor)
                  : textStyle,
            )
          : widget,
      color: color,
      onPressed: () {
        if (onClick != null) onClick!();
      },
    );*/
  }
}
