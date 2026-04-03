import 'package:encrypt/encrypt.dart' as encrypt;

class Crypto {
  static final encrypt.Key _key = encrypt.Key.fromUtf8('bong1234bonglong320123456789long'); // 32바이트 = AES-256
  static final encrypt.IV _iv = encrypt.IV.fromUtf8('abcdefghijklmno1'); // 반드시 16바이트

  static final encrypt.Encrypter _encrypter = encrypt.Encrypter(
    encrypt.AES(
      _key,
      mode: encrypt.AESMode.cbc,
      padding: 'PKCS7',
    ),
  );

  static String enc(String value) {
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    return encrypted.base64;
  }

  static String dec(String base64Value) {
    try {
      final encrypted = encrypt.Encrypted.fromBase64(base64Value);
      final decrypted = _encrypter.decrypt(encrypted, iv: _iv);
      return decrypted;
    } catch (e) {
      throw ArgumentError('복호화 실패: ${e.toString()}');
    }
  }
}
