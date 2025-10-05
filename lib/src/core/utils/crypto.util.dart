import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class CryptoUtil {
  final Key key;
  final IV iv;
  final Encrypter encrypter;

  CryptoUtil({
    String encryptionMethod = 'AES',
    String? secretKey,
    String? secretIv,
  })  : key = Key.fromBase16(_generateKey(secretKey ?? 'default_secret_key')),
        iv = IV.fromBase16(_generateIV(secretIv ?? 'default_secret_iv')),
        encrypter = Encrypter(AES(
            Key.fromBase16(_generateKey(secretKey ?? 'default_secret_key')),
            mode: AESMode.cbc));

  static String _generateKey(String secret) {
    var bytes = utf8.encode(secret);
    return sha256.convert(bytes).toString();
  }

  static String _generateIV(String secret) {
    var bytes = utf8.encode(secret);
    return sha256.convert(bytes).toString().substring(0, 32);
  }

  String encryptData(dynamic data) {
    String dataString = data is Map ? json.encode(data) : data.toString();
    final encrypted = encrypter.encrypt(dataString, iv: iv);
    return encrypted.base64;
  }

  String decryptData(String encryptedData) {
    final decrypted = encrypter.decrypt64(encryptedData, iv: iv);
    return decrypted;
  }
}
