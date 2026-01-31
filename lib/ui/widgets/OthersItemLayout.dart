import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/data/model/local/UsersModel.dart';

import 'CardLayoutWidget.dart';

class OthersItemLayout extends StatelessWidget {
  final UsersModel? userModel;
  final Color imageBackgroundColor;
  double? avatarSize;
  final Function(UsersModel, bool)? onUserSelected;

  OthersItemLayout({
    this.userModel,
    this.avatarSize,
    this.onUserSelected,
    this.imageBackgroundColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    this.avatarSize = avatarSize == null ? AppDimens.dimen30 : avatarSize;
    return CardLayoutWidget(
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: CircleAvatar(
              radius: avatarSize,
              backgroundColor: imageBackgroundColor,
              backgroundImage: NetworkImage(
                userModel?.userImageUrl ?? "",
              ),
            ),
          ),
          SizedBox(width: AppDimens.dimen5),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel?.userName ?? "",
                  style: AppTextStyles.descStyleBold,
                ),
                SizedBox(height: AppDimens.dimen5),
                Text(
                  userModel?.userPhone ?? "",
                  style: AppTextStyles.subDescStyleLight,
                ),
                SizedBox(height: AppDimens.dimen10),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.black,
                      size: AppDimens.dimen15,
                    ),
                    SizedBox(width: AppDimens.dimen2),
                    Flexible(
                      child: Text(
                        userModel?.userLocation ?? "",
                        style: AppTextStyles.subDescStyleLight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.dimen5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        (userModel?.status ?? "").toUpperCase(),
                        style: AppTextStyles.getStyle(
                          AppTextStyles.smallSubDescStyleRegular,
                          userModel?.status == "Success"
                              ? AppColors.merGreen
                              : AppColors.yellowColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: AppDimens.dimen2),
        ],
      ),
    );
  }
}
