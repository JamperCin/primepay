import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_pay/api/ui_api.dart';
import 'package:prime_pay/app/AppColors.dart';
import 'package:prime_pay/app/AppDimens.dart';
import 'package:prime_pay/app/AppTextStyles.dart';
import 'package:prime_pay/controller/PaymentController.dart';
import 'package:prime_pay/data/model/local/data_param.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanQrCodeScreen extends BaseScreenStandard {
  final PaymentController cont = Get.put(PaymentController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  RxString qrText = "".obs;
  bool doneScanning = false;
  RxString flashState = "OFF".obs;
  Barcode? result;
  QRViewController? qrController;

  @override
  void setModel(BaseObject baseObject) {
    super.setModel(baseObject);
    cont.setParam((baseObject is DataParam) ? baseObject : null);
  }

  @override
  Widget build(BuildContext context) {
    cont.setCurrentContext(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.merGreen,
        elevation: 0,
        title: Text(cont.dataParam?.data['title'] ?? "Prime Pay",
            style: AppTextStyles.getStyle(
                AppTextStyles.descStyleRegular, AppColors.white)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: buildQrView(context)),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.primaryGreenColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 5,
            cutOutSize: AppDimens.dimen300,
          ),
        ),
        Align(
          child: Padding(
              padding: EdgeInsets.only(bottom: AppDimens.dimen50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textInfo(),
                  FloatingActionButton(
                    backgroundColor: AppColors.white,
                    mini: true,
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.red,
                    ),
                    onPressed: onCloseOnClick,
                  ),
                ],
              )),
          alignment: Alignment.bottomCenter,
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.only(
                top: AppDimens.dimen100, right: AppDimens.dimen20),
            child: InkWell(
              onTap: () async {
                await qrController?.flipCamera();
              },
              child: UiApi.assetImage(
                "assets/images/scan.png",
                height: AppDimens.dimen25,
                width: AppDimens.dimen25,
              ),
            ),
          ),
          alignment: Alignment.topRight,
        )
      ],
    );
  }

  Widget textInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen16,
        vertical: AppDimens.dimen10,
      ),
      child: Text(
        "Place Qr Code properly in frame to scan.",
        style: AppTextStyles.getStyle(
            AppTextStyles.descStyleLight, AppColors.white),
      ),
    );
  }

  Future<void> onCloseOnClick() async {
    qrController?.dispose();
    Get.back();
  }

  void onQRViewCreated(QRViewController qrController) {
    this.qrController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      onQrScanned(scanData);
    });

    qrController.pauseCamera();
    qrController.resumeCamera();
  }

  Future<void> onQrScanned(Barcode scanData) async {
    if ((scanData.code ?? '').isNotEmpty && !doneScanning) {
      if (!doneScanning) {
        doneScanning = true;
        this.cont.goToCardDetails(data: scanData.code);
      }
      qrController?.dispose();
      debugPrint("CODE HERE == ${scanData.code}");
    }
  }

 /* Widget _buildQrView(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.merGreen,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 5,
            cutOutSize: AppDimens.dimen300,
          ),
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.only(bottom: AppDimens.dimen100),
            child: Text(
              "Place Qr Code properly in frame to scan.",
              style: AppTextStyles.getStyle(
                  AppTextStyles.descStyleLight, AppColors.white),
            ),
          ),
          alignment: Alignment.bottomCenter,
        )
      ],
    );
  }*/

  /*void _onQRViewCreated(QRViewController controller) {
    this.cont.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!doneScanning) {
        doneScanning = true;
        this.cont.goToCardDetails(data: scanData.code);
      }
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }*/
}
