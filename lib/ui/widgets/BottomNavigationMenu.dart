import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/ui/widgets/CardLayoutWidget.dart';

class BottomNavigationMenu extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function? onClick;
  final RxBool? isClicked;

  BottomNavigationMenu({
    this.iconData = Icons.home,
    this.title = "",
    this.onClick,
    this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return CardLayoutWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      elevation: 0,
      borderColor: AppColors.merGreen,
      cardBackground: AppColors.merGreen,
      onclick: () {
        if (isClicked != null) {
          isClicked!.value = !(isClicked!.value);
        }
        if (onClick != null) onClick!();
      },
      child: Column(
        children: [
          Flexible(
            child: Obx(
              () => Icon(
                iconData,
                color: isClicked != null && isClicked!.value
                    ? AppColors.merBlue
                    : AppColors.white,
              ),
            ),
            flex: 1,
          ),
          SizedBox(
            height: 0,
          ),
          Flexible(
            child: Obx(
              () => Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getStyle(
                    AppTextStyles.subDescRegular,
                    isClicked != null && isClicked!.value
                        ? AppColors.merBlue
                        : AppColors.white,
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
