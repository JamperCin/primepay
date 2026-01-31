import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';

class InputDecoratedWidget extends StatefulWidget {
  final bool isMandatory;
  final String hintText;
  final bool isSecure;
  bool isObscureText = false;
  final IconData? prefixIcon;
  final IconData? suffix;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  FocusNode? selfFocusNode;
  final FocusNode? nextFocusNode;
  final bool autoFocus;
  double? fontSize;
  double? contentPadding;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final int minLines;
  int? maxLength;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextCapitalization textCapitalization;
  TextEditingController? controller;
  bool isInputValid = false;
  bool isFieldEmpty = true;
  bool isTextArea = false;
  final String text;
  final bool isEnabled;
  final String errorMessage;
  final VerifyFieldHandler? verifyFieldHandler;
  final int maxLines;
  final Function(String)? onEditingComplete;
  final Function()? onClick;
  final Function()? onFieldSubmitted;

  final bool filled;
  final labelText;

  // final bool shouldAddBorder;

  InputDecoratedWidget({
    this.verifyFieldHandler,
    this.labelText = "",
    this.isMandatory = false,
    this.borderColor = AppColors.white,
    this.focusedBorderColor = AppColors.primaryGreenColor,
    this.isSecure = false,
    this.maxLines = 1,
    this.contentPadding,
    this.onEditingComplete,
    this.controller,
    this.maxLength,
    this.isEnabled = true,
    this.isTextArea = false,
    this.borderRadius = 30,
    this.minLines = 1,
    this.text = "",
    this.hintText = "",
    this.errorMessage = "Field is required",
    this.prefixIcon,
    this.suffix,
    this.filled = true,
    this.autoFocus = false,
    this.fontSize,
    this.keyBoardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.selfFocusNode,
    this.nextFocusNode,
    this.fontFamily = AppStrings.FONT_FAMILY,
    this.fontWeight = FontWeight.w300,
    this.textCapitalization = TextCapitalization.none,
    this.onClick,
    this.onFieldSubmitted,
  });

  @override
  _InputDecoratedWidgetState createState() => _InputDecoratedWidgetState();
}

class _InputDecoratedWidgetState extends State<InputDecoratedWidget> {
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
    //print("Sa $v isValid $isNotEmpty");
    return isNotEmpty;
  }

  @override
  void initState() {
    // widget.controller.text = widget.text;
    if (widget.controller == null) {
      widget.controller = new TextEditingController();
    }

    if (widget.text.isNotEmpty) {
      widget.controller?.text = widget.text;
    }

    if (widget.selfFocusNode == null) {
      widget.selfFocusNode = new FocusNode();
    }

    widget.contentPadding = widget.contentPadding == null
        ? AppDimens.dimen10
        : widget.contentPadding;

    widget.fontSize =
        widget.fontSize == null ? AppDimens.desc : widget.fontSize;
    widget.maxLength = widget.maxLength == null ? 5000 : widget.maxLength;

    super.initState();
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
                    minLines: widget.minLines,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    enabled: widget.isEnabled,
                    onEditingComplete: () {
                      if (widget.controller != null &&
                          widget.onEditingComplete != null) {
                        widget
                            .onEditingComplete!(widget.controller?.text ?? "");
                      }
                    },
                    onChanged: (value) {
                      isInputFieldValid = value.trim().isNotEmpty;
                    },
                    obscureText: widget.isSecure
                        ? !widget.isObscureText
                        : widget.isSecure,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          widget.contentPadding ?? AppDimens.dimen20),
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.borderRadius),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      filled: widget.filled,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      fillColor: AppColors.nearlyWhite,
                      isDense: true,
                      labelText: widget.labelText,
                      hintText: widget.hintText,
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
                              size: AppDimens.dimen25,
                            ),
                    ),
                    keyboardType: widget.keyBoardType,
                    textInputAction: widget.textInputAction,
                    focusNode: widget.selfFocusNode,
                    textCapitalization: widget.textCapitalization,
                    style: TextStyle(
                        fontSize: widget.fontSize,
                        fontFamily: widget.fontFamily,
                        fontWeight: widget.fontWeight,
                        color: AppColors.black),
                    onFieldSubmitted: (v) {
                      widget.selfFocusNode?.unfocus();
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                      if (widget.onFieldSubmitted != null) {
                        widget.onFieldSubmitted!();
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
          Text(widget.isFieldEmpty ? " " : widget.errorMessage,
              style: TextStyle(
                fontSize: AppDimens.dimen10,
                color: Colors.red,
                fontFamily: widget.fontFamily,
                fontWeight: FontWeight.w300,
              )),
        ],
      ),
    );
  }
}

class VerifyFieldHandler {
  Function? checkEmptyField;
  bool? isInputValid;
}
