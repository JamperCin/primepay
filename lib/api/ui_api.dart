import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/dialogs_api.dart';
import 'package:prime_pay/api/snack_bar_api.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/app/assets_config.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';
import 'package:prime_pay/ui/utils/number_utils.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../data/model/local/rating_model.dart';
import '../data/model/local/rich_text_model.dart';
import '../ui/utils/Utils.dart';

class UiApi {
  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressIndicator({double? radius, Color? color}) {
    return CupertinoActivityIndicator(
      animating: true,
      color: color,
      radius: radius ?? AppDimens.dimen30,
    );
  }

  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressBar(
      {double? radius, Color? color, double? width}) {
    return SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: width ?? 1.5,
      ),
    );
  }

  ///This is an Extension of [circularProgressIndicator] with a square background
  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressIndicatorExt({double? radius}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.black,
      ),
      padding: EdgeInsets.all(AppDimens.dimen25),
      child: circularProgressIndicator(
          radius: AppDimens.dimen20, color: AppColors.white),
    );
  }

  /// Creates a [FormField] that contains a [TextField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  ///
  /// For documentation about the various parameters, see the [TextField] class
  /// and [new TextField], the constructor.
  static Widget textFormField({
    TextEditingController? controller,
    bool isPasswordField = false,
    String obscuringCharacter = "*",
    String? hintText,
    String? labelText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    // RxBool? isValid,
    int? maxLines = 1,
    double borderRadius = 8,
    double? height,
    int? minLines,
    bool expands = false,
    int? maxLength,
    bool isTextArea = false,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    EdgeInsetsGeometry? contentPadding,
    Function(String)? onFieldSubmitted,
    TextStyle? style,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    Color? focusColor,
    Color? unFocusColor,
    Color? borderColor,
    Color? disabledColor,
  }) {
    RxBool obscureText = isPasswordField.obs;
    // isValid = isValid ?? true.obs;
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: height ?? (isTextArea ? null : AppDimens.dimen55),
          child: TextFormField(
            style: style ?? AppTextStyles.descStyleLight,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(AppDimens.dimen2),
                      child: prefixIcon,
                    )
                  : prefixIcon,
              suffixIcon: isPasswordField
                  ? GestureDetector(
                      onTap: () {
                        obscureText.value = !obscureText.value;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(AppDimens.dimen12),
                        child: SvgPicture.asset(
                          obscureText.value
                              ? AssetsConfig.eye
                              : AssetsConfig.crossedEye,
                          height: AppDimens.dimen10,
                          width: AppDimens.dimen10,
                        ),
                      ),
                    )
                  : suffixIcon,
              hintText: hintText,
              labelText: labelText,
              hintStyle: hintStyle,
              labelStyle: labelStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.black,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: disabledColor ?? AppColors.black,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: unFocusColor ?? AppColors.black,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusColor ?? AppColors.introColor2,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              //  filled: true,
              //isDense: true,
              //contentPadding: contentPadding ?? EdgeInsets.all(AppDimens.dimen10),
            ),
            obscureText: obscureText.value,
            obscuringCharacter: obscuringCharacter,
            validator: validator,
            onSaved: onSaved,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            enabled: enabled,
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: maxLines,
            expands: expands,
            minLines: minLines,
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ),
    );
  }

  /// A Material Design "Text Button".
  ///
  /// Use text buttons on toolbars, in dialogs, or inline with other
  /// content but offset from that content with padding so that the
  /// button's presence is obvious. Text buttons do not have visible
  /// borders and must therefore rely on their position relative to
  /// other content for context.
  static Widget button({
    String text = "",
    Color backgroundColor = AppColors.introColor2,
    Color textColor = AppColors.white,
    Color? animateColor,
    Color? borderColor,
    TextStyle? textStyle,
    Widget? child,
    required VoidCallback? onPressed,
    double? border,
    double? width,
    double? height,
    double opacity = 0.4,
  }) {
    return SizedBox(
      width: width ?? SizeConfig.screenWidth * .75,
      height: height ?? AppDimens.dimen48,
      child: Container(
        decoration: deco(
          borderRadius: border ?? 50,
          opacity: opacity,
          borderColor: borderColor ?? backgroundColor,
        ),
        child: TextButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
          child: child ??
              Text(
                text,
                style: textStyle ??
                    AppTextStyles.titleStyleSemiBold.copyWith(
                      color: textColor,
                    ),
              ),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.grey,
            minimumSize: Size(SizeConfig.screenWidth * .75, AppDimens.dimen40),
            backgroundColor: backgroundColor,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimen14,
              vertical: AppDimens.dimen5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border ?? 50),
            ),
          ),
        ),
      ),
    );
  }

  /// A Material Design "Text Button" with decorated .
  ///
  /// Use text buttons on toolbars, in dialogs, or inline with other
  /// content but offset from that content with padding so that the
  /// button's presence is obvious. Text buttons do not have visible
  /// borders and must therefore rely on their position relative to
  /// other content for context.
  static Widget decoratedButton({
    String text = "",
    String asset = "assets/images/ic_google.svg",
    Color backgroundColor = AppColors.lineColor,
    Color borderColor = AppColors.lineColor,
    Color textColor = AppColors.black,
    GestureTapCallback? onTap,
    Widget? icon,
    IconData? trailIcon,
    Color? iconColor,
    double? height,
    double? width,
    double? iconHeight,
    double? spacer,
    TextStyle? style,
    EdgeInsets margin = const EdgeInsets.all(0),
    EdgeInsets? padding,
    EdgeInsets? iconPadding,
  }) {
    return InkWell(
      splashColor: AppColors.introColor2,
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: Container(
          padding: padding ?? EdgeInsets.all(AppDimens.dimen5),
          width: width ?? SizeConfig.screenWidth * .75,
          height: height ?? AppDimens.dimen48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: .5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: iconPadding ?? EdgeInsets.zero,
                child: icon ??
                    assetImage(
                      asset,
                      height: iconHeight ?? AppDimens.dimen35,
                      width: iconHeight ?? AppDimens.dimen35,
                      assetColor: iconColor,
                    ),
              ),
              //SizedBox(width: spacer ?? AppDimens.dimen20),
              Flexible(
                child: Center(
                  child: Text(
                    text,
                    style:
                        style ?? AppTextStyles.body1.copyWith(color: textColor),
                  ),
                ),
              ),
              trailIcon != null
                  ? Icon(trailIcon, color: iconColor ?? AppColors.black)
                  : const SizedBox(),
              SizedBox(width: AppDimens.dimen5),
            ],
          ),
        ),
      ),
    );
  }

  static Widget textButton({
    String leadingText = "",
    String trailingText = "",
    TextStyle? leadingStyle,
    TextStyle? trailingStyle,
    Color leadingTextColor = Colors.grey,
    Color trailingTextColor = AppColors.black,
    GestureTapCallback? onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: leadingText,
            style: leadingStyle ??
                AppTextStyles.subDescRegular.copyWith(
                  color: leadingTextColor,
                ),
          ),
          const TextSpan(text: "  "),
          TextSpan(
            text: trailingText,
            style: trailingStyle ??
                AppTextStyles.descStyleBold.copyWith(
                  color: trailingTextColor,
                ),
          ),
        ]),
      ),
    );
  }

  ///Create a circle image with a default radius of 60
  static Widget circleImageView({
    String url = "",
    double? radius,
    String asset = "assets/images/prime.png",
    GestureTapCallback? onTap,
  }) {
    radius = radius ?? AppDimens.dimen50;

    if (url.isEmpty) {
      return GestureDetector(
        child: assetImage(asset, height: radius * 2),
        onTap: onTap,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.grey.withOpacity(.3),
        backgroundImage: NetworkImage(url),
        radius: radius,
      ),
    );
  }

  static Widget loader({int size = 3, Widget? child}) {
    List<Widget> list = [];
    while (list.length != size) {
      list.add(child ?? const ProfileShimmer());
    }
    return SingleChildScrollView(
      child: Column(
        children: list,
      ),
    );
  }

  static Widget loaderMore({String text = "Loading more ..."}) {
    return Container(
      decoration: deco(
        opacity: 0.1,
        borderRadius: 0,
        color: AppColors.background,
        borderColor: AppColors.background,
      ),
      padding: EdgeInsets.all(AppDimens.dimen5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circularProgressBar(radius: AppDimens.dimen20),
          SizedBox(width: AppDimens.dimen24),
          Text(
            text,
            style: AppTextStyles.subDescStyleMedium,
          ),
        ],
      ),
    );
  }

  static void showConfirmDialog({
    String imageAsset = "assets/images/primepay.png",
    String? imageUrl,
    String title = "Confirm",
    String buttonTitle = "Confirm",
    String message = "Proceed",
    Function? callBack,
    Color color = AppColors.background,
    Color? assetColor,
    Color? buttonColor,
    bool shouldDismissDialog = true,
    double? containerSize,
    double? assetSize,
    Widget? icon,
    Widget? assetIcon,
    Widget? messageWidget,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
  }) {
    DialogsApi.showBottomSheet(
        isDismissable: shouldDismissDialog,
        isDraggable: shouldDismissDialog,
        backgroundColor: color,
        containerSize: containerSize ?? AppDimens.dimen380,
        mainChild: ListView(
          children: [
            assetIcon ??
                (imageUrl == null
                    ? assetImage(
                        imageAsset,
                        assetColor: assetColor,
                        height: assetSize,
                        width: assetSize,
                      )
                    : imageLoader(
                        url: imageUrl,
                        height: assetSize ?? SizeConfig.screenWidth * 0.4,
                        width: SizeConfig.screenWidth * 0.3,
                        //borderRadius: 10,
                        fit: BoxFit.fill,
                        //imageBackgroundColor: AppColors.background,
                      )),
            SizedBox(height: AppDimens.dimen10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ?? AppTextStyles.descStyleRegular,
            ),
            SizedBox(height: AppDimens.dimen10),
            messageWidget ??
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: messageStyle ?? AppTextStyles.smallSubDescStyleLight,
                ),
            SizedBox(height: AppDimens.dimen25),
            icon != null
                ? decoratedButton(
                    text: buttonTitle,
                    icon: icon,
                    backgroundColor: buttonColor ?? AppColors.introColor2,
                    onTap: () {
                      Get.back();
                      if (callBack != null) callBack();
                    },
                  )
                : button(
                    text: buttonTitle,
                    backgroundColor: buttonColor ?? AppColors.introColor2,
                    onPressed: () {
                      Get.back();
                      if (callBack != null) callBack();
                    },
                  ),
          ],
        ));
  }

  static Widget iconOnClick({
    String title = "Message",
    IconData icon = Icons.message_rounded,
    GestureTapCallback? onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: AppDimens.dimen18,
            color: color ?? AppColors.skyBlueColor,
          ),
          Text(
            title,
            style: AppTextStyles.smallSubDescStyleRegular.copyWith(
              color: AppColors.iconColors,
            ),
          )
        ],
      ),
    );
  }

  static Widget assetImage(
    String image, {
    double? height,
    double? width,
    Color? assetColor,
    BoxFit? fit,
  }) {
    return GetUtils.isImage(image)
        ? Image.asset(
            image,
            height: height ?? AppDimens.dimen150,
            width: width ?? AppDimens.dimen150,
            color: assetColor,
            fit: fit,
          )
        : SvgPicture.asset(
            image,
            height: height ?? AppDimens.dimen150,
            width: width ?? AppDimens.dimen150,
            color: assetColor,
            fit: fit ?? BoxFit.contain,
          );
  }

  static Widget checkBox(
    Function(bool) onChange, {
    TextStyle? style,
    Widget? textWidget,
    String text = "",
    Function? onTextClick,
    bool? checkValue,
  }) {
    RxBool isChecked = false.obs;
    isChecked.value = checkValue ?? false;
    return Obx(
      () => Row(
        children: [
          Flexible(
            flex: 0,
            child: Checkbox(
              activeColor: AppColors.primaryGreenColor,
              value: isChecked.value,
              onChanged: (value) {
                isChecked.value = value!;
                onChange(value);
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: text.isNotEmpty || textWidget != null
                ? GestureDetector(
                    onTap: () {
                      onTextClick!();
                    },
                    child: textWidget ?? Text(text, style: style))
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  /// UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration
  static Widget pinTextField(
    RxString pin, {
    int codeLength = 6,
    Function(String)? call,
    bool observable = true,
  }) {
    return observable
        ? Obx(
            () => PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle:
                    TextStyle(fontSize: AppDimens.dimen24, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: pin.value,
              codeLength: codeLength,
              onCodeSubmitted: (code) {
                pin.value = code;
                if (code.length == (codeLength)) {
                  if (call != null) call(code);
                }
              },
              onCodeChanged: (code) {
                pin.value = code!;
                if (code.length == (codeLength)) {
                  if (call != null) call(code);
                }
              },
            ),
          )
        : PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle:
                  TextStyle(fontSize: AppDimens.dimen24, color: Colors.black),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            currentCode: pin.value,
            codeLength: codeLength,
            onCodeSubmitted: (code) {
              pin.value = code;
              if (code.length == (codeLength)) {
                if (call != null) call(code);
              }
            },
            onCodeChanged: (code) {
              pin.value = code!;
              if (code.length == (codeLength)) {
                if (call != null) call(code);
              }
            },
          );
  }

  static Widget bottomNavItem({
    String? text,
    String iconAsset = "assets/images/ic_promo.svg",
    IconData? icon,
    bool isBadge = false,
    RxInt? count,
    GestureTapCallback? onTap,
    double? iconSize,
    Color iconColor = Colors.white,
  }) {
    count = count ?? 0.obs;
    iconSize = iconSize ?? AppDimens.dimen24;

    ///return item
    return InkWell(
      splashColor: AppColors.white,
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isBadge
                ? badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                        padding: EdgeInsets.all(AppDimens.dimen5)),
                    badgeContent: Text(
                      '$count',
                      style: AppTextStyles.subDescStyleBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    child: icon == null
                        ? assetImage(
                            iconAsset,
                            height: iconSize,
                            width: iconSize,
                            assetColor: iconColor,
                          )
                        : Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                  )
                : icon == null
                    ? assetImage(
                        iconAsset,
                        height: iconSize,
                        width: iconSize,
                        assetColor: iconColor,
                      )
                    : Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
            SizedBox(height: AppDimens.dimen5),
            text != null
                ? Text(
                    text,
                    style: AppTextStyles.subDescStyleLight.copyWith(
                      color: iconColor,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  static Widget pinEntryWidget(int size, RxInt fill) {
    List<Widget> row = [];
    for (int i = 1; i <= size; i++) {
      row.add(
        Obx(
          () => Container(
            margin: EdgeInsets.all(AppDimens.dimen5),
            height: AppDimens.dimen12,
            width: AppDimens.dimen12,
            decoration: BoxDecoration(
              color:
                  i <= fill.value ? AppColors.introColor2 : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.introColor2,
                width: .5,
              ),
            ),
          ),
        ),
      );
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: row);
  }

  static Widget circleEmpty({
    double? size,
    double opacity = 0.0,
    Color? borderColor,
    Color? backGroundColor,
    Color? colorOpacity,
    Widget child = const Icon(Icons.notifications),
    EdgeInsetsGeometry padding = const EdgeInsets.all(5),
    EdgeInsetsGeometry margin = const EdgeInsets.all(5),
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backGroundColor ?? Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? AppColors.black,
            width: .5,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: colorOpacity ?? AppColors.grey.withOpacity(opacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }

  static Widget containerRoundCorners({
    double? size,
    Color? borderColor,
    double? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Widget child = const SizedBox(),
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    GestureTapCallback? onTap,
    DecorationImage? bgImg,
    Gradient? gradient,
    BorderRadiusGeometry? border,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(AppDimens.dimen10),
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          image: bgImg,
          border: Border.all(
            color: borderColor ?? AppColors.white,
            width: .5,
          ),
          borderRadius: border ?? BorderRadius.circular(borderRadius ?? 10),
          gradient: gradient,
        ),
        child: Center(child: child),
      ),
    );
  }

  static Widget container({Widget? child, Color? color}) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimens.dimen5,
        bottom: AppDimens.dimen5,
      ),
      padding: EdgeInsets.all(AppDimens.dimen4),
      child: child,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(.5),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static Widget getProfilePic({
    double? radius,
    String url = '',
    GestureTapCallback? onTap,
    //Function? doneLoading,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.grey.withOpacity(0.6),
              offset: const Offset(2.0, 4.0),
              blurRadius: 8,
            ),
          ],
        ),
        child: circleImageView(
          url: url,
          radius: radius ?? AppDimens.dimen30,
        ),
      ),
    );
  }

  static Widget appBarStyledWidget({
    // AnimationController? animationController,
    //Animation<double>? topBarAnimation,
    double topBarOpacity = 20,
    Widget title = const Text("Prime E-Gift", textAlign: TextAlign.center),
    Widget action =
        const Icon(Icons.notifications, color: AppColors.primaryGreenColor),
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(topBarOpacity),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.dimen32),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColors.grey.withOpacity(0.4 * topBarOpacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: MediaQuery.of(context).padding.top,
          // ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen16,
                right: AppDimens.dimen16,
                top: AppDimens.dimen16 - AppDimens.dimen8 * topBarOpacity,
                bottom: AppDimens.dimen12 - AppDimens.dimen8 * topBarOpacity),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimens.dimen8),
                    child: title,
                  ),
                ),
                Align(
                  child: Padding(
                      padding: EdgeInsets.only(right: AppDimens.dimen5),
                      child: action),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget chatBarWidget({
    TextEditingController? ctr,
    Color backgroundColor = Colors.white,
    String hintText = "Type here...",
    Function(String)? onFieldSubmitted,
  }) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: AppDimens.dimen45,
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              decoration: deco(borderRadius: 20),
              child: Center(
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: ctr,
                  onFieldSubmitted: (val) {
                    if (onFieldSubmitted != null) {
                      onFieldSubmitted(val);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(AppDimens.dimen2),
                    isDense: true,
                    //  labelText: hintText,
                    hintText: hintText,
                    hintStyle: AppTextStyles.descStyleLight
                        .copyWith(color: AppColors.deactivatedText),
                    fillColor: backgroundColor,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                  ),
                  style: AppTextStyles.descStyleRegular,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimens.dimen20),
          Flexible(
            flex: 0,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.primaryGreenColor,
              onPressed: () {},
              child: const Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }

  static Widget searchBarWidget({
    String? hintText,
    String? text,
    Color backgroundColor = Colors.white,
    double borderRadius = 0,
    Function(String)? onSearchChanged,
    Function(String)? onFieldSubmitted,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double elevation = 5,
    GestureTapCallback? onTap,
    TextEditingController? ctr,
    IconData? icon,
    Widget? trailWidget,
    double? height,
    bool enabled = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height ?? AppDimens.dimen50,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: AppDimens.dimen8,
              vertical: AppDimens.dimen3,
            ),
        decoration: deco(borderRadius: borderRadius, color: backgroundColor),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.search,
              color: AppColors.deactivatedText,
              size: AppDimens.dimen15,
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: ctr,
                enabled: enabled,
                onChanged: (val) {
                  if (onSearchChanged != null) {
                    onSearchChanged(val);
                  }
                },
                onFieldSubmitted: (val) {
                  if (onFieldSubmitted != null) {
                    onFieldSubmitted(val);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(AppDimens.dimen2),
                  isDense: true,
                  hintText: hintText ?? "Search transaction...",
                  hintStyle: AppTextStyles.descStyleLight
                      .copyWith(color: AppColors.deactivatedText),
                  fillColor: backgroundColor,
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                  ),
                ),
                style: AppTextStyles.descStyleRegular,
              ),
            ),
            trailWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget appBarNotification(RxInt counter,
      {Color? iconColor, double? iconSize, GestureTapCallback? onTap}) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: badges.Badge(
          badgeContent: Text(
            "${counter.value}",
            style: AppTextStyles.smallSubDescStyleBold.copyWith(
              color: AppColors.white,
            ),
          ),
          badgeAnimation: badges.BadgeAnimation.slide(),
          child: Icon(
            Icons.notifications,
            color: iconColor ?? AppColors.primaryGreenColor,
            size: iconSize ?? AppDimens.dimen28,
          ),
        ),
      ),
    );
  }

  static Widget titleView({
    String title = "",
    Widget subTitle = const SizedBox(),
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      color: backgroundColor ?? AppColors.background,
      margin: padding ??
          EdgeInsets.only(left: AppDimens.dimen20, right: AppDimens.dimen10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: AppTextStyles.titleStyleSemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          subTitle,
        ],
      ),
    );
  }

  static Widget subTitleView(
      {String text = "",
      Function? onSubTextOnClick,
      int podLength = 0,
      RxInt? currentIndex,
      TextStyle? style,
      EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.dimen5)),
      onTap: () {
        if (onSubTextOnClick != null) {
          onSubTextOnClick();
        }
      },
      child: podLength > 0
          ? pod(podLength, currentIndex ?? 0.obs)
          : Padding(
              padding: padding,
              child: Row(
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.left,
                    style: style ??
                        AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.primaryGreenColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: style == null
                        ? AppColors.primaryGreenColor
                        : style.color,
                    size: AppDimens.dimen14,
                  ),
                ],
              ),
            ),
    );
  }

  static Widget pod(
    int podLength,
    RxInt currentIndex, {
    Function(int)? onTap,
    double? podSize,
    bool rectPod = false,
  }) {
    if (currentIndex.value > podLength) {
      currentIndex.value = 0;
    }
    List<Widget> list = [];
    for (int i = 0; i < podLength; i++) {
      list.add(Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(i);
              }
            },
            child: rectPod
                ? Container(
                    width: currentIndex.value == i
                        ? AppDimens.dimen24
                        : AppDimens.dimen16,
                    height: currentIndex.value == i
                        ? AppDimens.dimen5
                        : AppDimens.dimen4,
                    margin: EdgeInsets.only(right: AppDimens.dimen5),
                    decoration: deco(
                      color: currentIndex.value == i
                          ? AppColors.introColor2
                          : AppColors.introColor3,
                      opacity: 0.2,
                    ),
                  )
                : currentIndex.value >= 0
                    ? Container(
                        width: currentIndex.value == i
                            ? podSize ?? AppDimens.dimen32
                            : AppDimens.dimen24,
                        height: currentIndex.value == i
                            ? AppDimens.dimen10
                            : AppDimens.dimen5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex.value == i
                              ? AppColors.introColor2
                              : AppColors.introColor3,
                        ),
                      )
                    : Container(
                        width: AppDimens.dimen24,
                        height: AppDimens.dimen5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.introColor3,
                        ),
                      ),
          ),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  static Widget homeSearchBar({
    required Function(String) onSearchChanged,
    GestureTapCallback? onFilterClick,
    GestureTapCallback? onTap,
    EdgeInsetsGeometry? padding,
    Color? filterBgColor,
    Color? filterIconColor,
    String? hintText,
    String? text,
    bool enabled = true,
    TextEditingController? controller,
  }) {
    return FadeInUp(
      child: Padding(
        padding: padding ??
            EdgeInsets.only(
              left: AppDimens.dimen16,
              right: AppDimens.dimen16,
            ),
        child: Row(
          children: [
            Flexible(
              child: searchBarWidget(
                elevation: 2,
                onTap: onTap,
                onSearchChanged: onSearchChanged,
                borderRadius: 10,
                hintText: hintText,
                ctr: controller,
                enabled: enabled,
              ),
            ),
            SizedBox(width: AppDimens.dimen5),
            onFilterClick != null
                ? containerRoundCorners(
                    backgroundColor: filterBgColor ?? AppColors.introColor2,
                    child: assetImage(
                      "assets/images/ic_filter.svg",
                      height: AppDimens.dimen20,
                      width: AppDimens.dimen20,
                      assetColor: filterIconColor ?? AppColors.white,
                    ),
                    onTap: onFilterClick,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget menuItemWidget({
    String imagePath = "",
    String menuTitle = "",
    Function? onMenuOnClick,
    double borderRadius = 15,
    double opacity = 0.4,
    double? height,
    double? width,
    double? iconSize,
    double? iconPadding,
    double topPad = 1,
    double bottomPad = 1,
    double? padding,
    double? containerPadding,
    Color? borderColor,
    Color? circularColor,
    TextStyle? textStyle,
    bool circularIcon = false,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? border,
  }) {
    return FadeInUp(
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: EdgeInsets.all(containerPadding ?? AppDimens.dimen3),
        decoration: deco(
          border: border,
          borderRadius: borderRadius,
          opacity: opacity,
          borderColor: borderColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            splashColor: AppColors.lineColor.withOpacity(0.2),
            onTap: () {
              if (onMenuOnClick != null) {
                onMenuOnClick();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: topPad),
                circularIcon
                    ? circleEmpty(
                        borderColor:
                            circularColor ?? AppColors.primaryGreenColor,
                        padding:
                            EdgeInsets.all(iconPadding ?? AppDimens.dimen8),
                        child: imageLoader(
                          url: imagePath,
                          heroTag: menuTitle,
                          height: iconSize ?? AppDimens.dimen28,
                          width: iconSize ?? AppDimens.dimen28,
                        ),
                      )
                    : imageLoader(
                        url: imagePath,
                        heroTag: menuTitle,
                        height: iconSize ?? AppDimens.dimen35,
                        width: iconSize ?? AppDimens.dimen35,
                      ),
                SizedBox(height: AppDimens.dimen3),
                Flexible(
                  child: Center(
                    child: Text(
                      menuTitle,
                      textAlign: TextAlign.center,
                      style: textStyle ?? AppTextStyles.smallSubDescStyleMedium,
                    ),
                  ),
                ),
                SizedBox(height: bottomPad),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget elevatedImageLoader({
    double? height,
    double? width,
    double borderRadius = 10,
    String? heroTag,
    String? url,
    BoxFit? fit,
    Widget? placeHolder,
    double opacity = 0.4,
    bool isCircular = false,
    bool setOverlay = false,
    double? amount,
    String? showMerchantName,
  }) {
    return Container(
      decoration: deco(opacity: opacity, borderRadius: borderRadius),
      height: height,
      width: width,
      child: imageLoader(
        height: height,
        width: width,
        border: borderRadius,
        heroTag: heroTag,
        url: url,
        fit: fit,
        placeHolder: placeHolder,
        setOverlay: setOverlay,
      ),
    );
  }

  static Widget imageLoader({
    double? height,
    double? width,
    double? border,
    String? heroTag,
    String? url,
    BoxFit? fit,
    Widget? placeHolder,
    Widget? errorWidget,
    bool setOverlay = false,
    Function? doneLoading,
  }) {
    double progressSize = height == null ? AppDimens.dimen18 : (height / 4);
    try {
      url = url?.trim();

      var image = CachedNetworkImage(
        imageUrl: url ?? "",
        height: height ?? SizeConfig.screenWidth,
        width: width ?? SizeConfig.screenWidth,
        fit: fit ?? BoxFit.fill,
        placeholder: (context, url) =>
            placeHolder ??
            UiApi.circularProgressIndicator(radius: progressSize),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Icon(
              Icons.error,
              size: progressSize,
              color: AppColors.redLight,
            ),
      );

      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(border ?? 10),
            child: heroTag != null
                ? Hero(
                    tag: heroTag,
                    transitionOnUserGestures: true,
                    child: image,
                  )
                : image,
          ),
          setOverlay
              ? Container(
                  height: height ?? SizeConfig.screenWidth,
                  width: width ?? SizeConfig.screenWidth,
                  color: AppColors.blackOpacity,
                )
              : const SizedBox(),
        ],
      );
    } catch (e) {
      debugPrint("Exception Loading image  $e");
      return placeHolder ??
          UiApi.circularProgressIndicator(radius: progressSize);
    }
  }

  static Decoration deco({
    BorderRadiusGeometry? border,
    double borderRadius = 10,
    double opacity = 0.4,
    double borderWidth = 1,
    Color? color,
    Color? borderColor,
    Color? colorOpacity,
    double blurRadius = 5,
    BoxBorder? borderSide,
    bool applyBorder = true,
  }) {
    return BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: applyBorder
            ? (border ?? BorderRadius.all(Radius.circular(borderRadius)))
            : null,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorOpacity ?? AppColors.grey.withOpacity(opacity),
            offset: const Offset(1.1, 1.1),
            blurRadius: blurRadius,
          ),
        ],
        border: borderSide ??
            Border.all(
              color: borderColor ?? AppColors.white,
              width: borderWidth,
            ));
  }

  static Widget moreWidget({
    Color? color,
    String title = "",
    TextStyle? textStyle,
    RxBool? isCollapsed,
    Widget child = const Text(""),
  }) {
    isCollapsed = isCollapsed ?? false.obs;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen16, right: AppDimens.dimen16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(title,
                        style: textStyle ?? AppTextStyles.titleStyleBold)),
                InkWell(
                  onTap: () {
                    isCollapsed?.value = !isCollapsed.value;
                  },
                  child: Icon(
                      isCollapsed!.value
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: AppDimens.dimen30,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.dimen3),
          isCollapsed.value ? const SizedBox() : child,
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );
  }

  static noDataWidget({
    String? asset,
    String? url,
    Color? assetColor,
    String? title,
    String? message,
    double? assetSize,
    Widget? button,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            url == null
                ? assetImage(asset ?? "assets/images/ic_pay.png",
                    height: assetSize ?? AppDimens.dimen220,
                    width: assetSize ?? AppDimens.dimen220,
                    assetColor: assetColor)
                : imageLoader(
                    url: url,
                    height: assetSize ?? AppDimens.dimen170,
                    width: assetSize ?? AppDimens.dimen170),
            SizedBox(height: AppDimens.dimen30),
            Text(
              title ?? "Empty Disbursement History",
              style: AppTextStyles.titleStyleBold
                  .copyWith(fontSize: AppDimens.dimen18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen20),
            Text(
              message ??
                  "There are no disbursement transactions history. All redemptions and their disbursement will appear here.",
              style: AppTextStyles.descStyleLight,
              textAlign: TextAlign.center,
            ),
            button ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget billWidget(String title, String desc,
      {bool showBorder = true}) {
    return Card(
      elevation: 0,
      shape: Border(
        bottom:
            BorderSide(color: AppColors.background, width: showBorder ? 1 : 0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: AppDimens.dimen16,
          right: AppDimens.dimen10,
          left: AppDimens.dimen10,
          top: AppDimens.dimen16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(title, style: AppTextStyles.subDescStyleLight)),
            Flexible(child: Text(desc, style: AppTextStyles.descStyleRegular)),
          ],
        ),
      ),
    );
  }

  static Widget cardWidget({
    Widget? child,
    double? elevation,
    double? radius,
    double? borderWidth,
    ShapeBorder? shape,
    Color? color,
    Color? borderColor,
    BorderSide? borderSide,
    EdgeInsetsGeometry? margin,
  }) {
    return Card(
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 10),
            ),
            side: borderSide ??
                BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.green,
                ),
          ),
      child: child,
      margin: margin,
      elevation: elevation ?? 5,
      color: color ?? AppColors.white,
    );
  }

  static Widget reviewItem({required RatingModel mod, bool border = false}) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: Border(
        bottom: BorderSide(color: AppColors.lineColor, width: border ? 2 : 0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: AppDimens.dimen16,
          right: AppDimens.dimen10,
          left: AppDimens.dimen10,
          top: AppDimens.dimen16,
        ),
        child: Row(
          children: [
            circleImageView(
              url: mod.anonymous ? "" : mod.rater.profilePicUrl,
              radius: AppDimens.dimen20,
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                              mod.anonymous
                                  ? "Prime User"
                                  : Utils.capitalizeLetter(
                                      capAllFirstLetters: true,
                                      val: mod.rater.firstName,
                                    ),
                              style: AppTextStyles.descStyleSemiBold)),
                      Flexible(
                        child: ratingBar(rating: mod.rating),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(mod.reviewMessage,
                      style: AppTextStyles.subDescStyleLight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget infoText(
    String text, {
    TextStyle? style,
    Widget? trailing,
    Widget? child,
    Function? onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: color ?? AppColors.orange,
                  size: AppDimens.dimen18,
                ),
                SizedBox(width: AppDimens.dimen5),
                Flexible(
                  child: child ??
                      Text(text,
                          style: style ?? AppTextStyles.subDescStyleLight),
                ),
                SizedBox(width: AppDimens.dimen5),
              ],
            ),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }

  static Widget buttonExt({
    GestureTapCallback? onTap,
    GestureTapCallback? onLongTap,
    double amount = 0.0,
    bool enabled = true,
    String error = "",
    String title = "",
    String subTitle = "",
    String asset = "assets/images/ic_prime_logo_white.png",
    Color? assetColor,
    Color? borderColor,
    TextStyle? subTitleStyle,
    Decoration? decoration,
    double? assetSize,
    double? elevation,
    EdgeInsets? padding,
    Widget? bottomChild,
  }) {
    return InkWell(
      onLongPress: () {
        if (!enabled) {
          SnackBarApi.snackBarInfo(error);
          return;
        }

        if (onLongTap != null) onLongTap();
      },
      onTap: () {
        if (!enabled) {
          SnackBarApi.snackBarInfo(error);
          return;
        }

        if (onTap != null) onTap();
      },
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              left: AppDimens.dimen5,
              right: AppDimens.dimen5,
              top: AppDimens.dimen3,
              bottom: AppDimens.dimen2,
            ),
        decoration: decoration ??
            deco(
                borderRadius: 10,
                opacity: elevation ?? 0.4,
                color: enabled ? AppColors.white : AppColors.kOffGrey,
                borderColor: enabled
                    ? (borderColor ?? AppColors.primaryGreenColor)
                    : AppColors.kOffGrey),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    assetImage(
                      asset,
                      assetColor: assetColor,
                      height: assetSize ?? AppDimens.dimen40,
                      width: assetSize ?? AppDimens.dimen40,
                    ),
                    SizedBox(width: AppDimens.dimen10),
                    Text(
                      title,
                      style: AppTextStyles.subDescRegular.copyWith(
                        color: enabled
                            ? AppColors.black
                            : AppColors.deactivatedText,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    subTitle,
                    style: subTitleStyle ??
                        AppTextStyles.h5StyleSemiBold.copyWith(
                          color: enabled
                              ? AppColors.black
                              : AppColors.deactivatedText,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(height: bottomChild != null ? AppDimens.dimen2 : 0),
            bottomChild ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget pinNumberWidget(List<dynamic> list, {Function(String)? onTap}) {
    List<Widget> widgetList = [];
    for (dynamic str in list) {
      if (str is String) {
        widgetList.add(Flexible(
          flex: 1,
          child: SizedBox(
              width: SizeConfig.screenWidth,
              child: numberWidget(str, onTap: onTap)),
        ));
      }
      if (str is Widget) {
        widgetList.add(
          Flexible(
              flex: 1,
              child: SizedBox(width: SizeConfig.screenWidth, child: str)),
        );
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgetList,
    );
  }

  static Widget numberWidget(String text, {Function(String)? onTap}) {
    return FloatingActionButton(
      onPressed: () {
        if (onTap != null) onTap(text);
      },
      backgroundColor: Colors.transparent,
      heroTag: "_hero_$text",
      elevation: 0,
      child: Text(
        text,
        style:
            AppTextStyles.h2StyleMedium.copyWith(color: AppColors.introColor2),
      ),
    );
  }

  static Widget delPinWidget({GestureTapCallback? onTap}) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: Colors.transparent,
      elevation: 0,
      heroTag: "_del",
      child: Icon(
        Icons.backspace,
        size: AppDimens.dimen25,
        color: AppColors.introColor2,
      ),
    );
  }

  static Widget horizontalListView({
    required List<Widget> list,
    EdgeInsetsGeometry? padding,
    double aspectRatio = 4,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: padding ??
            EdgeInsets.only(
              top: AppDimens.dimen10,
              bottom: AppDimens.dimen10,
              //right: AppDimens.dimen2,
            ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => list[index],
      ),
    );
  }

  static Widget listView({
    BuildContext? context,
    required List<Widget> list,
    EdgeInsetsGeometry? padding,
    Widget separator = const SizedBox(),
    Widget? loadingWidget,
    RxBool? isLoadingMore,
    ScrollController? scrollController,
  }) {
    RxBool isLoading = isLoadingMore ?? false.obs;

    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Obx(() => isLoading.value
        ? (loadingWidget ?? UiApi.loaderMore())
        : const SizedBox()));
    list.add(SizedBox(height: AppDimens.dimen50));

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      controller: scrollController,
      padding: padding ??
          EdgeInsets.only(
            top: AppDimens.dimen16,
            left: SizeConfig.isTablet ? AppDimens.dimen30 : AppDimens.dimen24,
            right: SizeConfig.isTablet ? AppDimens.dimen30 : AppDimens.dimen24,
            bottom: context != null
                ? MediaQuery.of(context).padding.bottom
                : AppDimens.dimen50,
          ),
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => list[index],
      separatorBuilder: (BuildContext context, int index) {
        return separator;
      },
    );
  }

  static Widget textArea(
    TextEditingController controller, {
    String? hint,
    Function(String)? onChanged,
  }) {
    return UiApi.textFormField(
      isTextArea: true,
      maxLines: SizeConfig.isTablet
          ? AppDimens.dimen4.toInt()
          : AppDimens.dimen5.toInt(),
      maxLength: 500,
      style: AppTextStyles.descStyleRegular,
      controller: controller,
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      hintText: hint ?? "Type your message here...",
    );
  }

  static Widget richText(
      {required List<RichTextModel> mod,
      int? maxLines,
      TextAlign? textAlign,
      TextStyle? style}) {
    List<TextSpan> span = [];

    for (RichTextModel m in mod) {
      span.add(
        TextSpan(
          text: m.monitize
              ? NumberUtils.getCurrencyAmount(m.text, dec: 2)
              : m.text,
          style: m.style ?? style ?? AppTextStyles.descStyleRegular,
        ),
      );
    }

    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: span),
      textAlign: textAlign ?? TextAlign.start,
    );
  }

  static Widget messageItem({Function? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
        Get.back();
      },
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: deco(borderRadius: 5, opacity: 0.2),
        padding: EdgeInsets.all(AppDimens.dimen5),
        margin: EdgeInsets.only(
          top: AppDimens.dimen5,
          left: AppDimens.dimen2,
          right: AppDimens.dimen2,
        ),
        child: Row(
          children: [
            circleImageView(
              radius: AppDimens.dimen20,
              url:
                  "https://sweetlovemessages.net/wp-content/uploads/2021/08/Thank-You-Card-Messages-1-825x510-1.jpg",
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thank You",
                    style: AppTextStyles.descStyleBold,
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    "You are appreciated for all you do. Thank you so much.” “The work you do is important and so appreciated.” “Sending a little heartfelt appreciation your way today!”",
                    style: AppTextStyles.subDescStyleLight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget floatText(String text,
      {Color? color, TextStyle? style, String heroTag = "_hero"}) {
    return FloatingActionButton(
      mini: true,
      heroTag: "$text$heroTag",
      backgroundColor: color ?? AppColors.primaryGreenColor,
      child: Text(
        text,
        style:
            style ?? AppTextStyles.h5StyleBold.copyWith(color: AppColors.white),
      ),
      onPressed: () {},
    );
  }

  static Widget buttonChild({
    String asset = "assets/images/ic_market.svg",
    String text = "",
    Widget? icon,
    TextStyle? style,
    double? assetSize,
    Color? assetColor,
    Color? textColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon ??
            assetImage(
              asset,
              height: assetSize ?? AppDimens.dimen20,
              width: assetSize ?? AppDimens.dimen20,
              assetColor: assetColor,
            ),
        SizedBox(width: AppDimens.dimen10),
        Flexible(
          child: richText(
            mod: [
              RichTextModel(
                text: text,
                style: style ??
                    AppTextStyles.titleStyleBold.copyWith(
                      color: textColor ?? AppColors.white,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }

  static void popUpContainer({
    required BuildContext context,
    double borderRadius = 30,
    Color? backgroundColor,
    Widget? child,
  }) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BounceInRight(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              backgroundColor: backgroundColor ?? AppColors.black,
              child: Padding(
                padding: EdgeInsets.all(AppDimens.dimen10),
                child: child,
              ),
            ),
          );
        });
  }

  static leftChatWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        padding: EdgeInsets.all(AppDimens.dimen10),
        decoration: deco(
          border: const BorderRadius.only(bottomRight: Radius.circular(30)),
          color: AppColors.background,
          borderColor: AppColors.background,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello this a testing messsage from the left side",
                style: AppTextStyles.smallSubDescStyleRegular,
              ),
            ),
            SizedBox(height: AppDimens.dimen3),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "5th Feb, 04:45 pm",
                style: AppTextStyles.smallestSubDescStyleRegular.copyWith(
                  color: AppColors.deactivatedText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static rightChatWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        padding: EdgeInsets.all(AppDimens.dimen10),
        decoration: deco(
          border: const BorderRadius.only(bottomLeft: Radius.circular(30)),
          color: AppColors.background,
          borderColor: AppColors.background,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello this a testing messsage from the left side",
                style: AppTextStyles.smallSubDescStyleRegular,
              ),
            ),
            SizedBox(height: AppDimens.dimen3),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "5th Feb, 04:45 pm",
                style: AppTextStyles.smallestSubDescStyleRegular.copyWith(
                  color: AppColors.deactivatedText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget decText({
    String text = "",
    IconData? icon,
    TextStyle? style,
    int maxLines = 4,
    Widget? child,
    EdgeInsetsGeometry? padding,
  }) {
    return text.isNotEmpty || child != null
        ? Align(
            child: Padding(
              padding: padding ??
                  EdgeInsets.only(
                    left: AppDimens.dimen25,
                    right: AppDimens.dimen25,
                  ),
              child: Row(
                children: [
                  Icon(icon ?? Icons.add_link, size: AppDimens.dimen20),
                  SizedBox(width: AppDimens.dimen10),
                  child ??
                      Flexible(
                        child: richText(
                          maxLines: maxLines,
                          mod: [
                            RichTextModel(
                                text: text,
                                style: style ?? AppTextStyles.titleStyleBold),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            alignment: Alignment.centerLeft,
          )
        : const SizedBox();
  }

  // static Widget redemptionLogWidget(
  //   RxBool isDoneLoading,
  //   RxList<RedemptionLogs> list, {
  //   EdgeInsetsGeometry? padding,
  // }) {
  //   return Obx(() => isDoneLoading.value
  //       ? Padding(
  //           padding: padding ??
  //               EdgeInsets.only(
  //                   left: AppDimens.dimen24, right: AppDimens.dimen24),
  //           child: list.isNotEmpty
  //               ? Column(
  //                   children: _redemptionLogItem(list),
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                 )
  //               : UiApi.noDataWidget(
  //                   title: "No Redemption History",
  //                   asset: "assets/images/ic_success_pin.png",
  //                   message:
  //                       "You have no redemption(s) performed with this gift card account.",
  //                 ),
  //         )
  //       : UiApi.loader(size: 3));
  // }

  // static List<Widget> _redemptionLogItem(List<RedemptionLogs> list) {
  //   List<Widget> logs = [];
  //
  //   for (RedemptionLogs log in list) {
  //     logs.add(Container(
  //       decoration: UiApi.deco(borderRadius: 5),
  //       padding: EdgeInsets.only(
  //         left: AppDimens.dimen10,
  //         right: AppDimens.dimen10,
  //         top: AppDimens.dimen5,
  //         bottom: AppDimens.dimen5,
  //       ),
  //       margin: EdgeInsets.only(bottom: AppDimens.dimen5),
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Flexible(
  //                 flex: 0,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       DateTimeUtils.formatDateString(log.transactionDate,
  //                           format: "dd"),
  //                       style: AppTextStyles.h5StyleMedium
  //                           .copyWith(color: AppColors.lightDark),
  //                     ),
  //                     SizedBox(height: AppDimens.dimen5),
  //                     Text(
  //                       DateTimeUtils.formatDateString(log.transactionDate,
  //                           format: "MMM yy"),
  //                       style: AppTextStyles.subDescStyleLight
  //                           .copyWith(fontSize: AppDimens.dimen10)
  //                           .copyWith(color: AppColors.lightDark),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(width: AppDimens.dimen10),
  //               Flexible(
  //                 flex: 0,
  //                 child: Container(
  //                   width: .6,
  //                   height: AppDimens.dimen50,
  //                   color: AppColors.kSmokeWhite,
  //                 ),
  //               ),
  //               SizedBox(width: AppDimens.dimen10),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     UiApi.richText(
  //                       mod: [
  //                         RichTextModel(
  //                           text: Utils.capitalizeLetter(
  //                               val: log.branch.isEmpty
  //                                   ? log.merchant
  //                                   : log.branch,
  //                               capAllFirstLetters: true),
  //                           style: AppTextStyles.descStyleBold,
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: AppDimens.dimen3),
  //                     UiApi.richText(
  //                       mod: [
  //                         RichTextModel(
  //                           text: "Amount:  ",
  //                           style: AppTextStyles.smallerSubDescStyleLight,
  //                         ),
  //                         RichTextModel(
  //                           text: NumberUtils.getCurrencyAmount(log.amount,
  //                               dec: 2, currency: log.currency),
  //                           style: AppTextStyles.smallSubDescStyleRegular,
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: AppDimens.dimen2),
  //                     UiApi.richText(
  //                       mod: [
  //                         RichTextModel(
  //                           text: "Balance After:  ",
  //                           style: AppTextStyles.smallerSubDescStyleLight,
  //                         ),
  //                         RichTextModel(
  //                           text: NumberUtils.getCurrencyAmount(
  //                               log.balanceAfter,
  //                               dec: 2,
  //                               currency: log.currency),
  //                           style: AppTextStyles.smallSubDescStyleRegular,
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: AppDimens.dimen2),
  //                     UiApi.richText(
  //                       mod: [
  //                         RichTextModel(
  //                           text: "Status:  ",
  //                           style: AppTextStyles.smallerSubDescStyleLight,
  //                         ),
  //                         RichTextModel(
  //                           text: log.status.toUpperCase(),
  //                           style: AppTextStyles.smallerSubDescStyleRegular
  //                               .copyWith(
  //                                   color: CardUtils.getRedemptionStatusColor(
  //                             log.status,
  //                           )),
  //                         )
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Flexible(
  //                 flex: 0,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Icon(Icons.arrow_right, size: AppDimens.dimen20),
  //                     SizedBox(height: AppDimens.dimen10),
  //                     Text(
  //                       DateTimeUtils.formatDateString(log.transactionDate,
  //                           format: "hh:mm aa"),
  //                       style: AppTextStyles.smallestSubDescStyleRegular
  //                           .copyWith(color: AppColors.lightDark),
  //                     ),
  //                     // UiApi.richText(
  //                     //   mod: [
  //                     //     RichTextModel(
  //                     //       text: log.transactionType,
  //                     //       style: AppTextStyles.smallSubDescStyleBold,
  //                     //     )
  //                     //   ],
  //                     // ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           // const Divider(color: AppColors.dimWhiteExt)
  //         ],
  //       ),
  //     ));
  //   }
  //
  //   return logs;
  // }

  static Widget divider({double? height, double? width, Color? color}) {
    return Container(
      decoration:
          deco(color: color ?? AppColors.grey.withOpacity(0.3), opacity: 0),
      height: height ?? 1,
      width: width ?? 0.6,
    );
  }

  static Widget rowIconText({
    IconData icon = Icons.message,
    Color? color,
    double? size,
    String text = "",
    String subText = "",
    TextStyle? style,
    TextStyle? subTextStyle,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color ?? AppColors.iconColor,
            size: size ?? AppDimens.dimen16,
          ),
          SizedBox(width: AppDimens.dimen5),
          Text(
            text,
            style: style ?? AppTextStyles.subDescStyleLight,
          ),
          SizedBox(width: AppDimens.dimen20),
          Expanded(
            child: richText(textAlign: TextAlign.right, mod: [
              RichTextModel(
                text: subText,
                style: subTextStyle ?? AppTextStyles.descStyleRegular,
              )
            ]),
          ),
        ],
      ),
    );
  }

  static Widget rowIconButton({
    IconData icon = Icons.message,
    Color? iconColor,
    double? size,
    double? inMargin,
    String text = "",
    TextStyle? style,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.iconColor,
              size: size ?? AppDimens.dimen20,
            ),
            SizedBox(width: inMargin ?? AppDimens.dimen10),
            Flexible(
              child: Text(
                text,
                style: style ?? AppTextStyles.subDescStyleLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget rowText({
    String title = "",
    String subTitle = "",
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    int maxLines = 2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            title,
            style: titleStyle ?? AppTextStyles.subDescStyleLight,
          ),
        ),
        Flexible(
          flex: 2,
          child: richText(
            maxLines: maxLines,
            textAlign: TextAlign.end,
            mod: [
              RichTextModel(
                text: subTitle,
                style: subTitleStyle ?? AppTextStyles.subDescRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget syncTextField(TextEditingController ctrl,
      {GestureTapCallback? onTap, String hint = "Search location..."}) {
    return TextField(
      controller: ctrl,
      readOnly: true,
      onTap: () async {
        if (onTap != null) {
          onTap();
        }
      },
      decoration: InputDecoration(
        icon: Padding(
            padding: EdgeInsets.only(left: AppDimens.dimen10),
            child: Icon(
              Icons.search,
              size: AppDimens.dimen20,
              color: AppColors.black,
            )),
        hintText: hint,
        hintStyle: AppTextStyles.descStyleRegular,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(right: AppDimens.dimen5),
      ),
    );
  }

  static Widget locationItemWidget(String address, RxBool isLoading) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.black,
          size: AppDimens.dimen20,
        ),
        SizedBox(width: AppDimens.dimen10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected Location",
                style: AppTextStyles.descStyleMedium
                    .copyWith(color: AppColors.primaryGreenColor),
              ),
              SizedBox(height: AppDimens.dimen6),
              Text(
                address,
                style: AppTextStyles.descStyleRegular,
              )
            ],
          ),
        ),
        SizedBox(width: AppDimens.dimen5),
        isLoading.value
            ? circularProgressBar(radius: AppDimens.dimen14)
            : const SizedBox(),
      ],
    );
  }

  static Widget dialogContent(
    TextEditingController ctrl, {
    Function? onTap,
    String hint = "Enter answer",
    String buttonText = "Submit",
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppDimens.dimen40),
        textFormField(
          hintText: hint,
          labelText: hint,
          controller: ctrl,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: AppDimens.dimen40),
        button(
          text: buttonText,
          textColor: AppColors.white,
          backgroundColor: AppColors.primaryGreenColor,
          onPressed: () {
            Get.back();
            if (onTap != null) {
              onTap();
            }
          },
        ),
      ],
    );
    /* return Padding(
      padding: EdgeInsets.all(AppDimens.dimen20),
      child: Center(
        child: textFormField(
            hintText: "Phone Number",
            labelText: "Phone Number",
            controller: ctrl,
            keyboardType: TextInputType.phone),
      ),
    );*/
  }

  static Widget dialogMessage({
    String title = "",
    String mess = "",
    String asset = "assets/images/ic_warn.png",
    Widget? child,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppDimens.dimen5),
        assetImage(asset, height: AppDimens.dimen80, width: AppDimens.dimen80),
        SizedBox(height: AppDimens.dimen20),
        Text(
          title,
          style: AppTextStyles.titleStyleBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen10),
        child ??
            Text(
              mess,
              style: AppTextStyles.descStyleRegular,
              textAlign: TextAlign.center,
            ),
        SizedBox(height: AppDimens.dimen20),
      ],
    );
  }

  static Widget warningWidget(
    RxBool isValid, {
    GestureTapCallback? onTap,
    List<RichTextModel>? text,
    Color? bgColor,
    TextStyle? style,
  }) {
    return Obx(
      () => isValid.value
          ? const SizedBox()
          : InkWell(
              onTap: onTap,
              child: Container(
                decoration: deco(
                  color: bgColor ?? AppColors.redLight,
                  opacity: 0,
                  borderRadius: 0,
                ),
                child: richText(
                  maxLines: 6,
                  style: style,
                  mod: text ??
                      [
                        RichTextModel(
                          text: "Security Questions",
                          style: AppTextStyles.subDescStyleSemiBold
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text: " not set up on your account. Kindly",
                          style: AppTextStyles.subDescRegular
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text: " click here ",
                          style: AppTextStyles.subDescStyleBold
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text:
                              "to add this extra security layer in order not to lose your account when you forget your password or pin.",
                          style: AppTextStyles.subDescRegular
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text:
                              "\n\nNB: You will need this if you want to reset your password or PIN.",
                          style: AppTextStyles.subDescStyleMedium
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                ),
                padding: EdgeInsets.all(AppDimens.dimen10),
                margin: EdgeInsets.only(bottom: AppDimens.dimen10),
              ),
            ),
    );
  }

  static Widget ratingBarWidget({
    double initialRating = 0.0,
    double? size,
    int itemCount = 5,
    Function(double)? onRatingUpdate,
  }) {
    return RatingBar.builder(
      initialRating: initialRating,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.amber,
          size: size ?? AppDimens.dimen50,
        );
      },
      onRatingUpdate: (rating) {
        if (onRatingUpdate != null) {
          onRatingUpdate(rating);
        }
      },
    );
  }

  static Widget ratingBar({double rating = 0.0, double? rateSize}) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
        size: rateSize ?? AppDimens.dimen16,
      ),
      itemCount: 5,
      itemSize: rateSize ?? AppDimens.dimen16,
    );
  }

  static Widget settingsItemWidget(String title, GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: UiApi.deco(
          applyBorder: false,
          opacity: 0,
          borderSide: const Border(
            bottom: BorderSide(
              color: AppColors.kSmokeWhite,
              width: 1,
            ),
          ),
        ),
        padding:
            EdgeInsets.only(top: AppDimens.dimen20, bottom: AppDimens.dimen20),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen20,
            right: AppDimens.dimen20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.titleStyleRegular,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.black,
                size: AppDimens.dimen20,
              )
            ],
          ),
        ),
      ),
    );
  }

  static deleteAccountText({String text = "Deleting Account..."}) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen20),
      child: DefaultTextStyle(
        style: AppTextStyles.h5StyleBold.copyWith(
          color: AppColors.red,
        ),
        child: Text(
          text,
          style: AppTextStyles.h5StyleBold.copyWith(
            color: AppColors.redLight,
          ),
        ),
      ),
    );
  }

  ///Phone Widget
  static Widget phoneWidget({
    String hint = "",
    required RxString code,
    required RxString name,
    required RxString validString,
    required RxBool isValid,
    required TextEditingController ctrl,
    GestureTapCallback? onSelectCountry,
    Function(String)? onChanged,
  }) {
    return Column(
      children: [
        Container(
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onSelectCountry,
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(name.value,
                            style: AppTextStyles.titleStyleRegular),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: AppDimens.dimen16,
                      )
                    ],
                  ),
                ),
              ),
              UiApi.divider(height: 1, width: SizeConfig.screenWidth),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.dimen16,
                  right: AppDimens.dimen16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Center(
                        child: Text(code.value,
                            style: AppTextStyles.titleStyleBold),
                      ),
                    ),
                    SizedBox(width: AppDimens.dimen10),
                    Expanded(
                      child: UiApi.textFormField(
                        borderColor: AppColors.background,
                        focusColor: AppColors.background,
                        unFocusColor: AppColors.background,
                        hintText: hint,
                        keyboardType: TextInputType.phone,
                        controller: ctrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimens.dimen5),
        Align(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              validString.value,
              style: AppTextStyles.style(
                style: AppTextStyles.smallerSubDescStyleRegular,
                color:
                    isValid.value ? AppColors.primaryGreenColor : AppColors.red,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  static Widget iconText({
    bool icon = false,
    String text = "",
    double? pdBtm,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: pdBtm ?? AppDimens.dimen8),
      child: Row(
        children: [
          icon
              ? UiApi.assetImage(
                  "assets/images/ic_danger.png",
                  height: AppDimens.dimen20,
                  width: AppDimens.dimen20,
                )
              : Icon(
                  Icons.ac_unit,
                  size: AppDimens.dimen12,
                  color: AppColors.red,
                ),
          SizedBox(width: AppDimens.dimen14),
          Flexible(
            child: Text(
              text,
              style: icon
                  ? AppTextStyles.h4StyleBold
                      .copyWith(color: color ?? AppColors.black)
                  : AppTextStyles.descStyleRegular
                      .copyWith(color: color ?? AppColors.black),
            ),
          )
        ],
      ),
    );
  }

  static phoneInputWidget(TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDimens.dimen20),
        Text(
          'Confirm your Phone Number',
          style: AppTextStyles.descStyleMedium.copyWith(color: AppColors.black),
        ),
        SizedBox(height: AppDimens.dimen5),
        UiApi.textFormField(
          keyboardType: TextInputType.phone,
          controller: ctrl,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hintText: 'Phone number Eg. +233245....',
          prefixIcon: SvgPicture.asset(
            'assets/images/ic_mobile.svg',
          ),
        ),
      ],
    );
  }
}
