import 'package:prime_pay/app/PrefConstants.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/main.dart';
import 'package:prime_pay/ui/utils/Utils.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    logoUrl.value = "${getMerchant() != null ? getMerchant()?.logoUrl : ""}";
    initWidgets();
    checkForAppUpdate();
    checkLogin();
    super.onInit();
  }

  Future<void> getMerchantDetails() async {
    await Future.delayed(const Duration(seconds: 1));

    webService.getMerchantDetails((response) {
      if (response.data.merchant.name.isNotEmpty) {
        final details = Utils.convertEncode(response.data.merchant);
        logoUrl.value = response.data.merchant.logoUrl;
        preference?.setString(PrefConstants.MERCHANT_DETAILS, details);
        preference?.setString(
            PrefConstants.MERCHANT_CODE, response.data.merchant.code);
      }
    });
  }
}
