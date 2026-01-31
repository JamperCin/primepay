import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prime_pay/ui/dashboard/MainLandingScreen.dart';
import 'package:prime_pay/ui/intros/IntroMainScreen.dart';
import 'package:prime_pay/ui/login/LoginScreen.dart';
import 'package:prime_pay/ui/login/QuickLogin.dart';

import '../main.dart';

class AppRoutes {
  static const String rootRoute = "/";
  static const String homeRoute = "/home";

  AppRoutes._();

  static final route = [
    GetPage(name: rootRoute, page: () => getScreen()),
  ];

  static Widget getScreen() {
    if (!isIntroShown) {
      return IntroMainScreen();
    } else if (isRememberMe) {
      return QuickLogin();
    } else if (!isLogin) {
      return LoginScreen();
    } else {
      return MainLandingScreen();
    }
  }
}
