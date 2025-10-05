import 'dart:convert';

import 'package:aes_barcode_scanner/src/core/utils/crypto.util.dart';
import 'package:flutter/material.dart';

class ValidateQrCodeDataHelper {
  static String? validateQrCodeData(String? data) {
    String? result;

    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(
          CryptoUtil(secretKey: 'rahasia', secretIv: 'iv_rahasia')
              .decryptData(data));
      debugPrint('JSON DATA: $jsonData');

      if (jsonData['KATEGORI'] == null) {
        result = 'KATEGORI : ${jsonData['KATEGORI']}';
      }

      if (jsonData['ID'] == null) {
        result = '${result != null ? ', ' : ''}ID : ${jsonData['ID']}';
      }

      return result;
    } else {
      result = 'Barcode Data tidak ditemukan!';
    }

    return result;
  }

  static String extractQrCodeCategory(String? data) {
    String result = '';

    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(
          CryptoUtil(secretKey: 'rahasia', secretIv: 'iv_rahasia')
              .decryptData(data));

      if (jsonData['KATEGORI'] != null) {
        result = jsonData['KATEGORI'];
      }
    }

    return result;
  }

  static String? extractQrCodeId(String? data) {
    String? result;

    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(
          CryptoUtil(secretKey: 'rahasia', secretIv: 'iv_rahasia')
              .decryptData(data));

      if (jsonData['ID'] != null) {
        result = jsonData['ID'].toString();
      }
    }

    return result;
  }

  static Map<String, dynamic>? extractQrCode(String? data) {
    Map<String, dynamic>? result;

    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(
          CryptoUtil(secretKey: 'rahasia', secretIv: 'iv_rahasia')
              .decryptData(data));

      result = jsonData;
    }

    return result;
  }
}
