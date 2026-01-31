import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';

class CircleImageView extends StatelessWidget {
  RxBool isImageLoading = false.obs;
  double avatarSize;
  final Color imageBackgroundColor;
  final String imegeUrl;
  final String placeholderAsset;

  CircleImageView({
    this.avatarSize = 30,
    this.imageBackgroundColor = AppColors.background,
    this.imegeUrl = "",
    this.placeholderAsset = "assets/images/user_placeholder.png",
  });

  var placeholder;
  var networkImage;

  void listenToImageLoad() {
    placeholder = new Image.asset(
      '$placeholderAsset',
      height: avatarSize + AppDimens.dimen40,
      color: imageBackgroundColor,
    );

    if (imegeUrl == null || imegeUrl.isEmpty) {
      return placeholder;
    }

    networkImage = new NetworkImage(imegeUrl);
    networkImage.resolve(new ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          print(
              'NetworkImage is fully loaded and saved ${info.image} = ${call}');
          isImageLoading.value = true;
          // do something
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.avatarSize = avatarSize == null ? AppDimens.dimen30 : avatarSize;
    listenToImageLoad();

    return Obx(
      () => isImageLoading.value
          ? CircleAvatar(
              radius: avatarSize,
              backgroundColor: imageBackgroundColor,
              backgroundImage: networkImage)
          : placeholder,
    );
  }
}
