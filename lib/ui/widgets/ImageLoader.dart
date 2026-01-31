import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppStrings.dart';

class ImageLoader extends StatelessWidget {
  RxBool isImageLoading = false.obs;
  final double height;
  final double width;
  final double borderRadius;
  final Color imageBackgroundColor;
  String imegeUrl = "";
  String placeholderAsset = "";
  Widget? placeHolder;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at
  /// [paintImage].
  final BoxFit? fit;

  ImageLoader(
    this.imegeUrl, {
    this.height = 30,
    this.width = 30,
    this.imageBackgroundColor = AppColors.background,
    this.placeholderAsset = AppStrings.primeIcon,
    this.fit,
    this.borderRadius = 1,
    this.placeHolder,
  });

  var networkImage;

  void listenToImageLoad() {
    placeHolder = placeHolder == null
        ? new Image.asset(
            placeholderAsset,
            height: height,
            color: imageBackgroundColor,
          )
        : placeHolder;

    if (imegeUrl.isNotEmpty && imegeUrl != "null") {
      networkImage = new NetworkImage(imegeUrl.trim());
      networkImage.resolve(new ImageConfiguration()).addListener(
        ImageStreamListener(
          (info, call) {
            isImageLoading.value = true;
            // do something
          },
        ),
      );
    }

    // print("GG == $height");
  }

  @override
  Widget build(BuildContext context) {
    listenToImageLoad();
    return Obx(
      () => isImageLoading.value
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.network(
                imegeUrl.trim(),
                height: height,
                width: width,
                fit: fit,
              ),
            )
          : placeHolder ?? SizedBox(),
    );
  }
}
