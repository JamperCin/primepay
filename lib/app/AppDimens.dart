import 'package:prime_pay/ui/utils/SizeConfig.dart';

class AppDimens {
  static double h1 = getSize(28, 3.6);
  static double h3 = getSize(25, 3.4);
  static double h2 = getSize(18, 2.4);
  static double h4 = getSize(17, 2.2);
  static double h5 = getSize(16.5, 2.1);
  static double title = getSize(16, 2.0);
  static double desc = getSize(14, 1.8);
  static double subDesc = getSize(12, 1.6);
  static double smallSubDesc = getSize(10, 1.4);
  static double smallerSubDesc = getSize(9, 1.2);
  static double smallestSubDesc = getSize(8, 1.0);
  //Custom dimensions
  static double dimen5 = getSize(10, 0.8);
  static double dimen3 = getSize(3, 0.4);
  static double dimen4 = getSize(4, 0.6);
  static double dimen2 = getSize(2, 0.25);
  static double dimen1 = getSize(1, 0.05);
  static double dimen1_4 = getSize(1.4, 0.18);
  static double dimen1_8 = getSize(1.8, 0.30);
  static double dimen0_13 = getSize(0.13, 0.017);
  static double dimen0_18 = getSize(0.18, 0.027);
  static double dimen0_11 = getSize(0.11, 0.015);
  static double dimen10 = getSize(10, 1.5);
  static double dimen12 = subDesc;
  static double dimen32 = getSize(32, 4.2);
  static double dimen35 = getSize(35, 4.8);
  static double dimen100 = getSize(100, 12);
  static double dimen400 = getSize(400, 48);
  static double dimen380 = getSize(380, 46);
  static double dimen90 = getSize(90, 10);
  static double dimen120 = getSize(120, 16);
  static double dimen125 = getSize(120, 16.8);
  static double dimen150 = getSize(150, 20);
  static double dimen500 = getSize(500, 70);
  static double dimen130 = getSize(130, 17.5);
  static double dimen170 = getSize(170, 24);
  static double dimen240 = getSize(240, 32);
  static double dimen250 = getSize(250, 34);
  static double dimen260 = getSize(260, 35);
  static double dimen220 = getSize(220, 30);
  static double dimen200 = getSize(200, 28);
  static double dimen180 = getSize(180, 26);
  static double dimen300 = getSize(300, 36);
  static double dimen280 = getSize(280, 36);
  static double dimen60 = getSize(60, 8);
  static double dimen65 = getSize(65, 8.5);
  static double dimen62 = getSize(62, 9);
  static double dimen70 = getSize(70, 9);
  static double dimen80 = getSize(80, 10);
  static double dimen30 = getSize(30, 4);
  static double dimen28 = getSize(28, 3.8);
  static double dimen20 = getSize(20, 2.8);
  static double dimen25 = h3;
  static double dimen24 = getSize(24, 3.3);
  static double dimen22 = getSize(22, 3.0);
  static double dimen15 = getSize(15, 2);
  static double dimen16 = getSize(16, 2.2);
  static double dimen18 = getSize(16, 2.4);
  static double dimen8 = getSize(8, 1.1);
  static double dimen6 = getSize(6, 0.9);
  static double dimen40 = getSize(40, 5.2);
  static double dimen38 = getSize(38, 5.0);
  static double dimen36 = getSize(36, 4.8);
  static double dimen45 = getSize(45, 5.5);
  static double dimen48 = getSize(48, 6.0);
  static double dimen50 = getSize(50, 6.3);
  static double dimen55 = getSize(55, 7.5);

  static double dimen14 = desc;

  static double getSize(double defaultValue, double multiplier) {
    return SizeConfig.blockSizeVertical == 0.0 ||
            SizeConfig.blockSizeVertical == 0.0
        ? defaultValue
        : SizeConfig.blockSizeVertical * multiplier;
  }
}
