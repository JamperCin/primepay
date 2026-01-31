//import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/data/enum/PromotionType.dart';
import 'package:prime_pay/data/model/local/PrimeCardModel.dart';
import 'package:prime_pay/ui/utils/HexColor.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';

import 'ImageLoader.dart';

class PrimeCardWidget extends StatelessWidget {
  PrimeCardModel primeCardModel;
  RxBool isImageDoneLoading = false.obs;
  String currency;
  PromotionType promotionType = PromotionType.noPromo;
  final Axis scrollDirection;
  double width = SizeConfig.screenWidth;
  final double borderRadius;

  PrimeCardWidget({
    required this.primeCardModel,
    required this.isImageDoneLoading,
    this.currency = "¢",
    this.scrollDirection = Axis.horizontal,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    isImageDoneLoading =
        isImageDoneLoading == null ? false.obs : isImageDoneLoading;

    width = scrollDirection == Axis.horizontal
        ? SizeConfig.screenWidth * 0.9
        : SizeConfig.screenWidth;

    checkPromoType(primeCardModel);
    return primeCardModel == null
        ? listenToImageLoad(primeCardModel: primeCardModel)
        : normalCard();
  }

  ///Main Card which shows the card image template with the following details:
  ///-amount on card
  ///-Logo on card
  ///-
  Widget mainCard() {
    return Stack(
      children: [
        Obx(
          () => Column(
            children: [
              Flexible(
                  child: listenToImageLoad(primeCardModel: primeCardModel)),
            ],
          ),
        ),
        isCardCustom()
            ? SizedBox()
            : Align(
                alignment: getAlignment(
                  primeCardModel.mobileCardDesignProp != null
                      ? primeCardModel.mobileCardDesignProp.logoPosition
                      : [],
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen10),
                  child: ImageLoader(
                    "${primeCardModel.logo}",
                    height: AppDimens.dimen40,
                    width: AppDimens.dimen40,
                    fit: BoxFit.fill,
                    borderRadius: 10,
                  ),
                ),
              ),
        /*isCardCustom()
            ? SizedBox()
            : Align(
                alignment: getAlignment(
                  primeCardModel.mobileCardDesignProp != null
                      ? primeCardModel.mobileCardDesignProp.amount_position
                      : [],
                  defaultAlignment: Alignment.topRight,
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen10),
                  child: richText(),
                ),
              ),*/
      ],
    );
  }

  ///Normal Card
  Widget normalCard() {
    return GestureDetector(
      child: Container(
        height: SizeConfig.screenWidth * 0.55,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.grey.withOpacity(0.4),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        margin:
            EdgeInsets.only(top: AppDimens.dimen2, bottom: AppDimens.dimen2),
        child: mainCard(),
      ),
    );
  }

  Widget placeHolder = SizedBox();
  var networkImage;

  Widget listenToImageLoad({
    double? imageHeight,
    double? imageWidth,
    required PrimeCardModel primeCardModel,
  }) {
    placeHolder = ProfileShimmer();

    networkImage = new NetworkImage(
      "${primeCardModel.image}",
    );

    networkImage.resolve(new ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          isImageDoneLoading.value = true;
        },
      ),
    );

    return isImageDoneLoading.value
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              "${primeCardModel.image}",
              height: imageHeight == null
                  ? SizeConfig.screenWidth * 0.55
                  : imageHeight,
              width: imageWidth == null ? width : imageWidth,
              fit: BoxFit.fill,
            ),
          )
        : placeHolder;
  }

  AlignmentGeometry getAlignment(
    List<String> list, {
    AlignmentGeometry defaultAlignment = Alignment.topLeft,
  }) {
    if (list != null && list.length == 2) {
      String dir1 = list[0].toLowerCase();
      String dir2 = list[1].toLowerCase();

      if (dir1 == "bottom" && dir2 == "right") {
        return Alignment.bottomRight;
      }

      if (dir1 == "bottom" && dir2 == "left") {
        return Alignment.bottomLeft;
      }

      if (dir1 == "top" && dir2 == "right") {
        return Alignment.topRight;
      }

      if (dir1 == "top" && dir2 == "left") {
        return Alignment.topLeft;
      }

      print("LIST >> $list == $dir1 == $dir2");
    }

    return defaultAlignment;
  }

  AlignmentGeometry resolveAlign() {
    AlignmentGeometry amount = getAlignment(
      primeCardModel.mobileCardDesignProp != null
          ? primeCardModel.mobileCardDesignProp.amountPosition
          : [],
      defaultAlignment: Alignment.topRight,
    );

    AlignmentGeometry logo = getAlignment(
      primeCardModel.mobileCardDesignProp != null
          ? primeCardModel.mobileCardDesignProp.logoPosition
          : [],
      defaultAlignment: Alignment.topLeft,
    );

    return logo == amount ? Alignment.topLeft : logo;
  }

  bool isCardCustom() {
    return primeCardModel.mobileCardDesignProp != null &&
        primeCardModel.mobileCardDesignProp.type != null &&
        "custom" == primeCardModel.mobileCardDesignProp.type;
  }

  Color amountTextColor() {
    String color = primeCardModel.mobileCardDesignProp != null &&
            primeCardModel.mobileCardDesignProp.defaultColor != null
        ? primeCardModel.mobileCardDesignProp.defaultColor
        : "";

    if (color.isEmpty) {
      return AppColors.black;
    }

    if (color.toLowerCase() == "black") {
      return AppColors.black;
    }

    if (color.toLowerCase() == "white") {
      return AppColors.white;
    }

    return HexColor(color);
  }

  void checkPromoType(PrimeCardModel primeCardModel) {
    if (primeCardModel == null || !primeCardModel.isPromotion) {
      promotionType = PromotionType.noPromo;
      return;
    }
    switch (primeCardModel.promoType) {
      case "promotionDiscount":
        promotionType = PromotionType.promotionDiscount;
        break;
      case "giveBack":
        promotionType = PromotionType.giveBack;
        break;
      case "specialPromo":
        promotionType = PromotionType.specialPromo;
        break;
      default:
        promotionType = PromotionType.noPromo;
        break;
    }
  }

  TextSpan getTitle() {
    if (promotionType == PromotionType.promotionDiscount) {
      return TextSpan(
        text: "${primeCardModel.promotionTitle}",
        style: AppTextStyles.descStyleBold,
      );
    } else if (promotionType == PromotionType.specialPromo) {
      return TextSpan(
        text: "${primeCardModel.promotionTitle}, ${primeCardModel.promoValue}",
        style: AppTextStyles.descStyleBold,
      );
    } else if (promotionType == PromotionType.giveBack) {
      return TextSpan(
        text:
            "${primeCardModel.title.isEmpty ? primeCardModel.promotionTitle : primeCardModel.title}",
        style: AppTextStyles.descStyleBold,
      );
    } else {
      return TextSpan(
        text:
            "${primeCardModel.title.isEmpty ? primeCardModel.promotionTitle : primeCardModel.title}",
        style: AppTextStyles.descStyleBold,
      );
    }
  }

  TextSpan getDescription() {
    return TextSpan(
      text: "${primeCardModel.description}",
      style: AppTextStyles.subDescStyleLight,
    );
  }
}
