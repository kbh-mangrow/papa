import 'package:shared_preferences/shared_preferences.dart';
import 'Crypto.dart';

//example
/*
await LocalStorage.set("test", "1234");
final value = await LocalStorage.get("test");
 */

class LocalStorage {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static Future<void> set(String key, String value) async {
    if (!value.isEmpty) {
      prefs.setString(key, Crypto.enc(value));
    }
    else {
      prefs.setString(key, '');
    }
  }
  static String? get(String key) {
    final enc = prefs.getString(key);
    if (enc != null && !enc.isEmpty) {
      return Crypto.dec(enc);
    }
    return null;
  }
}