import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppSharedPreference.dart';
import 'package:prime_pay/app/AppStrings.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/data/enum/PrinterTypes.dart';
import 'package:prime_pay/data/model/local/MerchantDetails.dart';
import 'package:prime_pay/http/WebService.dart';
import 'package:prime_pay/ui/login/QuickLogin.dart';
import 'package:prime_pay/ui/utils/SizeConfig.dart';
import 'package:prime_pay/ui/utils/Utils.dart';
import 'package:prime_pay/ui/utils/ValidationUtils.dart';
import 'package:prime_pay/ui/utils/WidgetUtils.dart';
import 'package:prime_pay/ui/widgets/ImageLoader.dart';
import 'package:prime_pay/ui/widgets/OutLinedButton.dart';
import 'package:prime_pay/ui/widgets/RoundButton.dart';

import '../main.dart';

class BaseController extends GetxController {
  BuildContext? context;
  //AppBaseResponse baseResponse = AppBaseResponse();
  late WidgetUtils widgetUtils = WidgetUtils();
  WebService webService = WebService();
  AppSharedPreference pref = Get.put(AppSharedPreference());
  ValidationUtils validationUtils = Get.put(ValidationUtils());

  String CURRENCY = "¢";
  TextEditingController tempController = new TextEditingController();
  static RxInt isNavMenuColorWhite = 0.obs;
  RxInt tokenExpirationCounter = 0.obs;
  bool isTokenExpirationDialogShown = false;
  String platformAccess = "pCdroid";
  RxString logoUrl = "".obs;

  //todo final LocalAuthentication auth = LocalAuthentication();
  RxBool canCheckBiometrics = false.obs;
  //todo RxList<BiometricType> availableBiometrics = new List<BiometricType>().obs;
  RxString authorizedMessage = 'Not Authorized'.obs;
  RxString authImageAsset = 'assets/images/fingerprint.png'.obs;
  RxString localizedReason = 'Scan your fingerprint to authenticate'.obs;
  RxBool isAuthenticating = false.obs;
  RxBool isAuthenticatingSuccess = false.obs;
  final String USER_TYPE = "merchant";

  InAppReview inAppReview = InAppReview.instance;

  @override
  void onInit() {
    getPlatformAccess();
    super.onInit();
  }

  void initWidgets() {
    webService = new WebService();
    widgetUtils = new WidgetUtils();
    pref = new AppSharedPreference();
    validationUtils = new ValidationUtils();
  }

  ///Automatically request user to rate your app on app store and playStore
  void autoRequestReview() async {
    if (preference?.getBool(PrefConstants.IS_REVIEW_POP_SHOWN) == null ||
        !(preference?.getBool(PrefConstants.IS_REVIEW_POP_SHOWN))!) {
      inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
        preference?.setBool(PrefConstants.IS_REVIEW_POP_SHOWN, true);
      }
    }
  }

  ///Manually request user to rate your app on app store and playStore
  void manualRequestReview() {
    inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(appStoreId: AppStrings.PRIME_PAY_APP_STORE_ID);
  }

  void getPlatformAccess() {
    platformAccess = kIsWeb ? "pCweb" :  Platform.isAndroid ? "pCdroid" : "pCios";
  }

  MerchantDetails? getMerchant() {
    String json = preference?.getString(PrefConstants.MERCHANT_DETAILS) ?? "";
    if (json.isEmpty) {
      return null;
    }
    var jsonResponse = convert.jsonDecode(json);
    // print("MERCH $jsonResponse");
    return MerchantDetails.fromJson(jsonResponse);
  }

  void setCurrentContext(BuildContext context) {
    this.context = context;
    SizeConfig().init(context);
    widgetUtils = WidgetUtils();
    widgetUtils.setCurrentContext(context);
    validationUtils = ValidationUtils();
    validationUtils.setWidgetUtils(widgetUtils);
  }

  void showSuccessSnackBar(String message) {
    widgetUtils.showSuccessSnackBar(message);
  }

  String getStringData(TextEditingController controller) {
    return controller.text.toString().trim();
  }

  void dismissKeyBoard() {
    FocusScope.of(context!).requestFocus(new FocusNode());
  }

  void setTempController(TextEditingController temp) {
    this.tempController = temp;
  }

  String getToken() {
    return "Bearer ${preference?.getString(PrefConstants.TOKEN)}";
  }

  void showErrorSnackBar(String message) {
    widgetUtils.showErrorSnackBar(message);
  }

  void showGeneralSnackBar({String message = "", String title = ""}) {
    widgetUtils.showGeneralSnackBar(title: title, message: message);
  }

  void showSessionTimeOutDialog() {
    isTokenExpirationDialogShown = true;
    widgetUtils.showBottomDialog(
        backgroundColor: AppColors.white,
        containerSize: AppDimens.dimen500,
        isDismissable: false,
        isDraggable: false,
        mainChild: ListView(
          children: [
            Image.asset("assets/images/error.jpg", height: AppDimens.dimen150),
            SizedBox(height: AppDimens.dimen20),
            Center(
              child: Text(
                "Session Expired",
                style: AppTextStyles.h2StyleRegular,
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            Center(
              child: Text(
                "Your session has expired or this user is currently logged in on another device. Kindly login again.",
                style: AppTextStyles.descStyleLight,
              ),
            ),
            SizedBox(height: AppDimens.dimen40),
            SizedBox(
              height: AppDimens.dimen45,
              child: RoundButton(
                textColor: AppColors.white,
                color: AppColors.primaryGreenColor,
                text: "OK",
                onClick: () {
                  Get.back();
                  isTokenExpirationDialogShown = false;
                  tokenExpirationCounter = 0.obs;
                  preference?.setBool(PrefConstants.IS_LOGIN, false);
                  Get.offAll(QuickLogin());
                },
              ),
            ),
          ],
        ));
  }

  ///Re-generate new Token and save to the shared preference
  ///Re-generate new Token and save to the shared preference
  void generateNewToken() {
    if (!pref.getBool(PrefConstants.IS_LOGIN)) {
      return;
    }

    tokenExpirationCounter++;

    if (tokenExpirationCounter.value >= 1 && !isTokenExpirationDialogShown) {
      showSessionTimeOutDialog();
    }
  }

  void showMerchantLogo(String logoUrl) {
    popUpConfirmDialog(
        child: ListView(
      children: [
        Text(
          "${getMerchant()?.name ?? ""}".toUpperCase(),
          textAlign: TextAlign.center,
          style: AppTextStyles.h2StyleRegular,
        ),
        SizedBox(height: AppDimens.dimen20),
        Padding(
          padding: EdgeInsets.all(AppDimens.dimen32),
          child: Center(
            child: ImageLoader(
              "${logoUrl}",
              height: AppDimens.dimen200,
              width: AppDimens.dimen200,
            ),
          ),
        ),
      ],
    ));
  }

  void popUpConfirmDialog({
    String imageAsset = "assets/images/banner.png",
    String title = "Confirm Adding Payment Wallet",
    String buttonTitle = "Confirm",
    String message =
        "Are you sure you want to add this wallet to your payment wallets?",
    Function? callBack,
    Color color = AppColors.background,
    bool shouldDismissDialog = true,
    Widget? child,
  }) {
    widgetUtils.showBottomDialog(
      isDismissable: shouldDismissDialog,
      isDraggable: shouldDismissDialog,
      backgroundColor: color,
      containerSize: AppDimens.dimen400,
      mainChild: child ??
          ListView(
            children: [
              Image.asset(
                imageAsset,
                height: AppDimens.dimen120,
              ),
              SizedBox(height: AppDimens.dimen10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.descStyleBold,
              ),
              SizedBox(height: AppDimens.dimen10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.subDescStyleLight,
              ),
              SizedBox(height: AppDimens.dimen25),
              SizedBox(
                height: AppDimens.dimen45,
                child: OutLinedButton(
                  text: buttonTitle,
                  filledColor: AppColors.primaryGreenColor,
                  outlineColor: AppColors.primaryGreenColor,
                  textColor: AppColors.white,
                  appTextStyle: AppTextStyles.descStyleMedium,
                  onClick: () {
                    Get.back();
                    if (callBack != null) callBack();
                  },
                ),
              )
            ],
          ),
    );
  }

  void checkForAppUpdate() {
   // if (printerType == PrinterType.NO_PRINTING) {
      webService.checkAppUpdate((response) {
        if (response.data != null) {
          int versionCode = 0;
          String updateMessage =
              "New update available on app store.\n\nClick below to update your app for improved functionality.";
          bool forceUpdate = true;

          if (Platform.isAndroid) {
            versionCode = response.data.meta.primePayAndroid.versionCode;
            updateMessage = response.data.meta.primePayAndroid.feature;
            forceUpdate = response.data.meta.primePayAndroid.forceUpdate;
          } else if (Platform.isIOS) {
            versionCode = response.data.meta.primePayIos.versionCode;
            updateMessage = response.data.meta.primePayIos.feature;
            forceUpdate = response.data.meta.primePayIos.forceUpdate;
          }

          checkIfUpdateNeeded(versionCode, updateMessage, forceUpdate);
          preference?.setString(PrefConstants.SALUTATION,
              response.data.meta.primePayPosReceiptContact);
        }
      });
   // }
  }

  checkIfUpdateNeeded(
      int updatedVersionCode, String updateMessage, bool forceUpdate) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = Utils.parseInt(packageInfo.buildNumber);

    //print("build number $buildNumber");

    if (updatedVersionCode > buildNumber) {
      popUpConfirmDialog(
          color: AppColors.white,
          imageAsset: "assets/images/update_app.jpg",
          title: "New Update Available.",
          message: updateMessage,
          buttonTitle: "Update Prime",
          shouldDismissDialog: !forceUpdate,
          callBack: () {
            print("update app");
            manualRequestReview();
          });
    }
  }
}
