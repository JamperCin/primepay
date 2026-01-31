import 'package:core_module/core/def/global_def.dart';
import 'package:prime_pay/controller/BaseController.dart';
import 'package:prime_pay/data/model/local/data_param.dart';
import 'package:prime_pay/ui/dashboard/entry/EntryCardCodeScreen.dart';
import 'package:prime_pay/ui/dashboard/scanqr/ScanQrCodeScreen.dart';

class AddFundsController extends BaseController {
  void onScanQrCode() {
    DataParam dataParam = DataParam(
      data: {"title": "Fund Card", "buttonTitle": "Proceed"},
    );
    navUtils.fireTarget(ScanQrCodeScreen(), model: dataParam);
  }

  void onEnterCardDigit() {
    DataParam dataParam = DataParam(
      data: {"title": "Fund Card", "buttonTitle": "Proceed"},
    );
    navUtils.fireTarget(EntryCardCodeScreen(), model: dataParam);
  }
}
