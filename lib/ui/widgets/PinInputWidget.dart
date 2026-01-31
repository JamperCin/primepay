import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';

class PinInputWidget extends StatefulWidget {
  final double borderRadius;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final FocusNode? selfFocusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController? textEditingController;
  final Function? onLastPinEntered;
  final double? size; // = AppDimens.dimen45;

  PinInputWidget({
    this.borderRadius = 0.0,
    this.size,
    this.focusedBorderColor = AppColors.primaryGreenColor,
    this.enabledBorderColor = AppColors.secondaryGreenColor,
    this.fontWeight = FontWeight.w300,
    this.fontFamily = AppStrings.FONT_FAMILY,
    this.selfFocusNode,
    this.nextFocusNode,
    this.textEditingController,
    this.onLastPinEntered,
  });

  @override
  _PinInputWidgetState createState() => _PinInputWidgetState();
}

class _PinInputWidgetState extends State<PinInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size ?? AppDimens.dimen45,
        height: widget.size ?? AppDimens.dimen45,
        child: TextFormField(
          focusNode: widget.selfFocusNode,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          inputFormatters: [
            new LengthLimitingTextInputFormatter(1),
          ],
          controller: widget.textEditingController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.enabledBorderColor,
                width: 1.0,
              ),
            ),
            //fillColor: Colors.green
          ),
          style: TextStyle(
              fontSize: AppDimens.h2,
              // height: .5,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight),
          onChanged: (text) {
            if (text.length == 1) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else {
                if (widget.selfFocusNode != null)
                  widget.selfFocusNode?.unfocus();
                if (widget.onLastPinEntered != null) {
                  widget.onLastPinEntered!();
                }
              }
            }
          },
        ));
  }
}
