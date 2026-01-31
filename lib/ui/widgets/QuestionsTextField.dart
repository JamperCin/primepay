import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class QuestionsTextField extends StatelessWidget {
  TextEditingController? controller;
  final String labelText;
  final String hintText;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  FocusNode? selfFocusNode;
  FocusNode? nextFocusNode;
  final TextCapitalization textCapitalization;
  final Function()? onFieldSubmitted;
  final Function()? onClick;
  final Function(String)? onTextChanged;
  final bool isEnabled;
  final IconData? suffix;
  final int maxLines;
  final int? maxLength;
  final TextAlign textAlign;
  TextStyle? textStyle;

  QuestionsTextField({
    this.controller,
    this.labelText = "",
    this.hintText = "",
    this.onTextChanged,
    this.selfFocusNode,
    this.nextFocusNode,
    this.keyBoardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
    this.onClick,
    this.suffix,
    this.maxLength,
    this.maxLines = 1,
    this.isEnabled = true,
    this.textStyle,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    selfFocusNode = selfFocusNode == null ? FocusNode() : selfFocusNode;
    nextFocusNode = nextFocusNode == null ? FocusNode() : nextFocusNode;
    controller = controller == null ? TextEditingController() : controller;
    textStyle = textStyle == null ? AppTextStyles.descStyleLight : textStyle;

    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: TextFormField(
          controller: controller,
          textAlign: textAlign,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(AppDimens.dimen5),
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            filled: true,
            hintStyle: AppTextStyles.getStyle(
                AppTextStyles.h2StyleLight, Colors.grey[800]!),
            fillColor: AppColors.nearlyWhite,
            isDense: true,
            suffixIcon: suffix != null
                ? Icon(
                    suffix,
                    size: AppDimens.dimen20,
                  )
                : SizedBox(),
            labelText: labelText,
            hintText: hintText,
            labelStyle: AppTextStyles.descStyleLight,
          ),
          keyboardType: keyBoardType,
          textInputAction: textInputAction,
          focusNode: selfFocusNode,
          enabled: isEnabled,
          maxLines: maxLines,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          style: textStyle,
          onChanged: (val) {
            if (onTextChanged != null) {
              onTextChanged!(val);
            }
          },
          onFieldSubmitted: (v) {
            selfFocusNode?.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
            if (onFieldSubmitted != null) {
              onFieldSubmitted!();
            }
          }),
    );
  }
}
