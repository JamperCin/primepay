import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class OutLinedButton extends StatefulWidget {
  final String text;
  final Function? onClick;
  final Color selectedColor;
  final bool isRoundedCorner;
  final Color textColor;
  final Color outlineColor;
  final Color filledColor;
  final double elevation;
  TextStyle? appTextStyle;
  final Widget? customWidget;

  OutLinedButton({
    this.text = "",
    this.onClick,
    this.elevation = 5,
    this.customWidget,
    this.selectedColor = AppColors.white,
    this.filledColor = AppColors.white,
    this.appTextStyle,
    this.outlineColor = AppColors.deactivatedText,
    this.textColor = AppColors.deactivatedText,
    this.isRoundedCorner = false,
  });

  @override
  _OutLinedButtonState createState() => _OutLinedButtonState();
}

class _OutLinedButtonState extends State<OutLinedButton> {
  @override
  Widget build(BuildContext context) {
    widget.appTextStyle =
        widget.appTextStyle ?? AppTextStyles.subDescStyleUltraLight;
    return ElevatedButton(
      onPressed: () {
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: widget.customWidget != null
          ? widget.customWidget
          : Text(
              widget.text,
              style: AppTextStyles.getStyle(
                  widget.appTextStyle!, widget.textColor),
            ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => widget.filledColor),
        textStyle:
            MaterialStateProperty.resolveWith((states) => widget.appTextStyle),
        elevation:
            MaterialStateProperty.resolveWith((states) => widget.elevation),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(widget.isRoundedCorner ? 25.0 : 5.0),
            side: BorderSide(
                color: widget.outlineColor,
                width: 0.5,
                style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}
