import 'package:core_module/core/def/global_def.dart';

class AppStrings {
  static final String BASE_URL = "https://" + HOST + "/";
  static String HOST = config.getEnvironment();
  static const String LIVE_HOST = "api.20pesewas.com";
  static const String DEMO_HOST = "api.primeegiftcard.com";
  static const String NGROK = "a0d0-154-161-54-197.ngrok-free.app";
  static const String FONT_FAMILY = "Montserrat";
  static const String PROD2 = "api-v1.primeegiftcard.net";
  static const String STAGING = "api-staging.primeegiftcard.net";

  //============== Images assets ================
  static const String primeLogo = "assets/vector/prime_banner.svg";
  static const String oldPrimeLogo = "assets/vector/white_old_prime_logo.svg";
  static const String primeIcon = "assets/images/prime_logo.png";

  static const String PRIME_PAY_APP_STORE_ID = "1555950295";
  static const String DATE_FORMAT = 'dd MMM yyyy';
}
