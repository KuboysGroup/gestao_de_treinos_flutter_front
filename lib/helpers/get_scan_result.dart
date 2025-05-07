import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

Future<String?> getScanResult(BuildContext context) async {
  return await SimpleBarcodeScanner.scanBarcode(
    context,
    barcodeAppBar: const BarcodeAppBar(
      appBarTitle: 'Test',
      centerTitle: false,
      enableBackButton: true,
      backButtonIcon: Icon(Icons.arrow_back_ios),
    ),
    isShowFlashIcon: true,
    delayMillis: 500,
    cameraFace: CameraFace.back,
    scanFormat: ScanFormat.ONLY_BARCODE,
  );
}
