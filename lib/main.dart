import 'dart:io';

import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core_module.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/enum/PrinterTypes.dart';
import 'package:prime_pay/ui/utils/PrintingUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/AppRoutes.dart';
import 'app/PrefConstants.dart';
import 'app/app_theme.dart';

SharedPreferences? preference;
bool isLogin = false;
bool isIntroShown = false;
bool isRememberMe = false;

///No need to check any Printer Type again, The platform will automatically check that.
//TODO : Always check for this printer Type and also from this
//TODO : location [android/app/src/main/java/com/kodeit/prime/prime_pay/PrinterHelper.java] on line 29
//TODO : Make sure both types are the same
//TODO : At the moment, there are only two POS configured for printing
//TODO : When the type is set to NO_PRINTING, that means this app should not have any print functionality
//TODO : and the same apk can go to play store and app store.
var printerType = PrinterType.NO_PRINTING;

Future<void> checkLogin() async {
  SharedPreferences.getInstance().then((value) {
    preference = value;
    isLogin = value.getBool(PrefConstants.IS_LOGIN) ?? false;

    isIntroShown = value.getBool(PrefConstants.IS_INTRO_SHOWN) ?? false;

    isRememberMe = value.getBool(PrefConstants.REMEMBER_LOGIN) ?? false;
    print("Done $isLogin == $isIntroShown === REM : $isRememberMe");
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogin();
  await PrintingUtils().checkDeviceModelToSetUpPrinter();
  await _initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    runApp(ParentApp());
  });
}

//Initialise the Core module library and other services here
Future<void> _initializeApp() async {
  await Future.delayed(const Duration(seconds: 1));
  // appPreference = AppPreference();
  // await appPreference.initPreference();
  await CoreModule().init(
    envPath: 'assets/data/env.json',
    defaultEnv: EnvType.production,
    loginScreen: 'LoginScreen',
    homePageScreen: 'MainLandingScreen',
  );
}

class ParentApp extends StatelessWidget {
  BaseController controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    appDimen = AppDimens(context, constantMultiplier: 1.9);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.rootRoute,
      getPages: AppRoutes.route,
      title: 'Prime Pay',
      theme: lightMode,
    );
  }
}
