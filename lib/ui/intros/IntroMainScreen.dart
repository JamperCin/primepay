import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/IntroController.dart';
import 'package:prime_pay/data/model/local/IntroModel.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';

class IntroMainScreen extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    controller.setCurrentContext(context);
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: IntroController.introList.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              reverse: false,
              height: MediaQuery.of(context).size.height,
              autoPlayCurve: Curves.fastOutSlowIn,
              //aspectRatio: 16 / 9,
              viewportFraction: 1,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: controller.onChange,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return page(IntroController.introList[index]);
            },
          ),

          ///Dotted Pod slider
          Transform.translate(
            offset: Offset(0, -AppDimens.dimen40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: IntroController.introList.map((url) {
                    int index = IntroController.introList.indexOf(url);
                    return Container(
                      width: AppDimens.dimen8,
                      height: AppDimens.dimen8,
                      margin: EdgeInsets.symmetric(
                        vertical: AppDimens.dimen10,
                        horizontal: AppDimens.dimen5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex.value == index
                            ? AppColors.prime_pay
                            : AppColors
                                .yellowColor, //Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          ///Done Button
          Transform.translate(
            offset: Offset(-AppDimens.dimen20, -AppDimens.dimen35),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Obx(
                () => controller.currentIndex.value ==
                        (IntroController.introList.length - 1)
                    ? TextButton(
                        onPressed: () {
                          controller.onDoneOnClick();
                        },
                        child: Text(
                          "Done",
                          style: AppTextStyles.subDescRegular,
                        ))
                    // ? OutLinedButton(
                    //     text: "Done",
                    //     textColor: AppColors.black,
                    //     filledColor: AppColors.white,
                    //     appTextStyle: AppTextStyles.descStyleLight,
                    //     onClick: () {
                    //       controller.onDoneOnClick();
                    //     },
                    //   )
                    : SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
    // page();
  }

  Widget page(IntroModel introModel) {
    return Scaffold(
      backgroundColor: introModel.color,
      body: SafeArea(
        child: Stack(
          children: [
            introModel.showBgAsset
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(0, AppDimens.dimen130),
                      child: Image.asset(
                        "${introModel.bgAsset}",
                      ),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: EdgeInsets.only(
                top: AppDimens.dimen32,
                right: AppDimens.dimen32,
                left: AppDimens.dimen32,
                bottom: AppDimens.dimen32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/images/primepay.png",
                      height: AppDimens.dimen100,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "${introModel.imageAsset}",
                        height: AppDimens.dimen250,
                      ),
                      SizedBox(height: AppDimens.dimen20),
                      Text(
                        "${introModel.title}",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.getStyle(
                          AppTextStyles.h1StyleRegular,
                          introModel.textColor,
                        ),
                      ),
                      SizedBox(height: AppDimens.dimen50),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      "${introModel.message}",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.getStyle(
                        AppTextStyles.titleStyleLight,
                        introModel.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
