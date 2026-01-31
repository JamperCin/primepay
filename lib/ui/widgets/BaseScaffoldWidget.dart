import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';

import 'TopBannerWidget.dart';

class BaseScaffoldWidget extends StatelessWidget {
  final bool isBackButtonNeeded;
  final double width;
  final double height;
  final Color? bannerBackgroundColor;
  final Color? appBarBackgroundColor;
  final double? appBarElevation;
  final String logoAssetName;
  final Widget? contentWidget;
  EdgeInsetsGeometry? contentWidgetPadding;
  final String? leadingIconRoute;
  final Widget? topWidget;
  double topWidgetFraction;
  final String appBarTitle;
  final bool isScrollNeeded;
  final Widget? actionWidget;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  BaseScaffoldWidget({
    this.isBackButtonNeeded = false,
    this.actionWidget,
    this.width = 20,
    this.height = 20,
    this.bannerBackgroundColor,
    this.appBarBackgroundColor,
    this.contentWidget,
    this.contentWidgetPadding,
    this.topWidget,
    this.topWidgetFraction = 1,
    this.appBarTitle = "",
    this.logoAssetName = AppStrings.primeIcon,
    this.leadingIconRoute,
    this.appBarElevation,
    this.bottomNavigationBar,
    this.isScrollNeeded = true,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig().init(context);
    topWidgetFraction =
        topWidgetFraction == null ? AppDimens.dimen0_11 : topWidgetFraction;
    contentWidgetPadding = contentWidgetPadding == null
        ? EdgeInsets.all(AppDimens.h3)
        : contentWidgetPadding;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            appBarTitle,
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleRegular, AppColors.white),
          ),
          backgroundColor: appBarBackgroundColor,
          actions: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(AppDimens.dimen16),
                child: actionWidget == null ? Text("") : actionWidget,
              ),
            ),
          ],
        ),
        backgroundColor: appBarBackgroundColor,
        body: isScrollNeeded
            ? SingleChildScrollView(
                child: Stack(
                  children: [
                    topWidget ??
                        TopBannerWidget(
                          width: width,
                          height: height,
                          logoAssetName: logoAssetName,
                          bannerBackgroundColor: bannerBackgroundColor,
                        ),
                    Transform.translate(
                      offset: Offset(
                          0,
                          topWidget == null
                              ? height * .175
                              : height * topWidgetFraction),
                      child: Container(
                        height: isPortrait ? height : height + height * .5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: contentWidgetPadding ?? EdgeInsets.zero,
                          child: contentWidget,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  topWidget ??
                      TopBannerWidget(
                        width: width,
                        height: height,
                        logoAssetName: logoAssetName,
                        bannerBackgroundColor: bannerBackgroundColor,
                      ),
                  Transform.translate(
                    offset: Offset(
                        0, topWidget == null ? height * .175 : height * .1),
                    child: Container(
                      height: isPortrait ? height : height + height * .5,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(AppDimens.dimen24),
                        child: contentWidget,
                      ),
                    ),
                  ),
                ],
              ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
