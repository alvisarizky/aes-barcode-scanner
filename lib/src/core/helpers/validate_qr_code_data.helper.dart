import 'dart:convert';

import 'package:aes_barcode_scanner/src/core/const/constants.dart';
import 'package:aes_barcode_scanner/src/core/utils/crypto.util.dart';
import 'package:flutter/material.dart';

class ValidateQrCodeDataHelper {
  static String? validateQrCodeData(String? data) {
    String? result;

    if (data != null) {
      String decodeData = CryptoUtil(
        secretKey: Secret.secretKey,
        secretIv: Secret.secretIv,
      ).decryptData(data);

      if (decodeData.isEmpty) {
        return 'Barcode Data tidak valid!';
      }

      Map<String, dynamic> jsonData = jsonDecode(decodeData);
      debugPrint('JSON DATA: $jsonData');

      return result;
    } else {
      result = 'Barcode Data tidak ditemukan!';
    }

    return result;
  }

  static Map<String, dynamic>? extractQrCode(String? data) {
    Map<String, dynamic>? result;

    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(
        CryptoUtil(
          secretKey: Secret.secretKey,
          secretIv: Secret.secretIv,
        ).decryptData(data),
      );

      result = jsonData;
    }

    return result;
  }
}
