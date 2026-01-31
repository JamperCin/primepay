import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';

class TopBannerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? bannerBackgroundColor;
  final String logoAssetName;

  TopBannerWidget({
    this.width,
    this.height,
    this.bannerBackgroundColor,
    this.logoAssetName = AppStrings.primeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: (height ?? AppDimens.dimen20) * .25,
          width: width,
          color: bannerBackgroundColor,
        ),
        Center(
          child: Transform.translate(
            offset: Offset(0, 0),
            child: Image.asset(
              logoAssetName,
              color: Colors.white,
              height: AppDimens.dimen100,
              width: AppDimens.dimen100,
            ),
          ),
        )
      ],
    );
  }
}
