import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/app/AppTextStyles.dart';

class InputTextFieldWidget extends StatefulWidget {
  final bool isMandatory;
  final String hintText;
  final String labelText;
  final bool isSecure;
  bool isObscureText = false;
  final Widget? prefixIcon;
  final IconData? suffix;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  FocusNode? selfFocusNode;
  final FocusNode? nextFocusNode;
  final bool autoFocus;
  double? fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextCapitalization textCapitalization;
  TextEditingController? controller;
  bool isInputValid = false;
  bool isFieldEmpty = true;
  final String errorMessage;
  final String? text;
  final VerifyFieldHandler? verifyFieldHandler;
  final int maxLines;
  final Function(String)? onEditingComplete;
  final Function? onGoOnClick;
  final bool isEnabled;
  final Function()? onClick;

  // final bool shouldAddBorder;

  InputTextFieldWidget({
    this.verifyFieldHandler,
    this.isMandatory = false,
    this.isSecure = false,
    this.maxLines = 1,
    this.text,
    this.onEditingComplete,
    this.suffix,
    this.isEnabled = true,
    this.controller,
    this.onClick,
    this.hintText = "",
    this.labelText = "",
    this.errorMessage = "Field is required",
    this.prefixIcon,
    this.autoFocus = false,
    this.fontSize,
    this.keyBoardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.selfFocusNode,
    this.nextFocusNode,
    this.fontFamily = AppStrings.FONT_FAMILY,
    this.fontWeight = FontWeight.w300,
    this.textCapitalization = TextCapitalization.none,
    this.onGoOnClick,
  });

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  bool isInputFieldValid = false;

  void checkEmptyField() {
    setState(() {
      if (widget.isMandatory) {
        widget.isFieldEmpty = widget.controller != null &&
            widget.controller!.text.trim().isNotEmpty;
      }
    });
  }

  bool isInputValid() {
    String v = widget.controller?.text.trim() ?? "";
    bool isNotEmpty = v.isNotEmpty;
    return isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      widget.controller = new TextEditingController();
    }

    if (widget.selfFocusNode == null) {
      widget.selfFocusNode = new FocusNode();
    }
    widget.controller?.text = widget.text ?? "";

    widget.fontSize =
        widget.fontSize == null ? AppDimens.desc : widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.verifyFieldHandler != null) {
      widget.verifyFieldHandler?.checkEmptyField = checkEmptyField;
      widget.verifyFieldHandler?.isInputValid = isInputValid();
    }

    return GestureDetector(
      onTap: () {
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                    controller: widget.controller,
                    autofocus: widget.autoFocus,
                    maxLines: widget.maxLines,
                    enabled: widget.isEnabled,
                    onEditingComplete: () {
                      if (widget.controller != null &&
                          widget.onEditingComplete != null) {
                        widget
                            .onEditingComplete!(widget.controller?.text ?? "");
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        widget.isFieldEmpty = value.trim().isNotEmpty;
                      });
                    },
                    obscureText: widget.isSecure
                        ? !widget.isObscureText
                        : widget.isSecure,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(AppDimens.dimen3),
                      isDense: true,
                      labelText: widget.labelText,
                      hintText: widget.hintText,
                      hintStyle: AppTextStyles.descStyleLight,
                      labelStyle: AppTextStyles.descStyleLight,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.isSecure
                          ? IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: widget.isObscureText
                                    ? AppColors.primaryGreenColor
                                    : Colors.grey,
                              ),
                              iconSize: AppDimens.dimen20,
                              onPressed: () {
                                setState(() {
                                  widget.isObscureText = !widget.isObscureText;
                                });
                              },
                            )
                          : Icon(
                              widget.suffix,
                              size: AppDimens.dimen20,
                            ),
                    ),
                    keyboardType: widget.keyBoardType,
                    textInputAction: widget.textInputAction,
                    focusNode: widget.selfFocusNode,
                    textCapitalization: widget.textCapitalization,
                    style: AppTextStyles.descStyleLight,
                    onFieldSubmitted: (v) {
                      widget.selfFocusNode?.unfocus();
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                      if (widget.onGoOnClick != null) {
                        widget.onGoOnClick!();
                      }
                    }),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  widget.isMandatory ? "*" : " ",
                  style: TextStyle(color: Colors.red, fontSize: AppDimens.desc),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.dimen5,
          ),
          Text(
            widget.isMandatory
                ? (widget.isFieldEmpty ? " " : widget.errorMessage)
                : "",
            style: AppTextStyles.getStyle(
              AppTextStyles.smallSubDescStyleLight,
              Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyFieldHandler {
  Function? checkEmptyField;
  bool? isInputValid;
}
