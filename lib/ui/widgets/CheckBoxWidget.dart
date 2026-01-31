import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class CheckBoxWidget extends StatefulWidget {
  final String text;
  TextStyle? textStyle;
  final Color? textColor;
  final Color? activeColor;
  final Function(bool checked)? onCheckedChanged;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool isChecked;
  final Widget? textWidget;

  CheckBoxWidget({
    this.text = "",
    this.textColor,
    this.activeColor,
    this.onCheckedChanged,
    this.isChecked = false,
    this.fontFamily = AppStrings.FONT_FAMILY,
    this.fontWeight = FontWeight.w300,
    this.textStyle,
    this.textWidget,
  });

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool checkedValue = false;

  @override
  void initState() {
    checkedValue = widget.isChecked;
    widget.textStyle = widget.textStyle == null
        ? AppTextStyles.descStyleLight
        : widget.textStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.text.isEmpty
        ? Checkbox(
            activeColor: widget.activeColor,
            value: checkedValue,
            onChanged: (value) {
              setState(() {
                checkedValue = value!;
                if (widget.onCheckedChanged != null) {
                  widget.onCheckedChanged!(value);
                }
              });
            },
          )
        : Row(
            children: [
              Flexible(
                flex: 0,
                child: Checkbox(
                  activeColor: widget.activeColor,
                  value: checkedValue,
                  onChanged: (value) {
                    setState(() {
                      checkedValue = value!;
                      if (widget.onCheckedChanged != null) {
                        widget.onCheckedChanged!(value);
                      }
                    });
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: widget.textWidget ??
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          checkedValue = !checkedValue;
                          if (widget.onCheckedChanged != null) {
                            widget.onCheckedChanged!(checkedValue);
                          }
                        });
                      },
                      child: Text(
                        widget.text,
                        style: AppTextStyles.getStyle(
                          widget.textStyle ?? AppTextStyles.subDescStyleLight,
                          widget.textColor ?? AppColors.black,
                        ),
                      ),
                    ),
              )
            ],
          );
  }
}
