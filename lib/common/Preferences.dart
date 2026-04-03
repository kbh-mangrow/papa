import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:papa/common/Crypto.dart';
import 'Archive.dart';

//example
/*
  await Preferences.init();
  await Preferences.set("test", "1234");
  final value = Preferences.get("test");
 */

class Preferences {
  static String prefName = "";
  static init() async {
    await Hive.initFlutter();
    prefName = await Archive.getPackageName();
    prefName += '2025x';
    await Hive.openBox(prefName);
  }
  static Future<void> set(String key, String value) async {
    final box = await Hive.box(prefName);
    if (!value.isEmpty) {
      box.put(key, Crypto.enc(value));
    }
    else {
      box.put(key, '');
    }
  }
  static String? get(String key) {
    final box = Hive.box(prefName);
    final enc = box.get(key);
    if (enc != null && !enc.isEmpty) {
      return Crypto.dec(enc);
    }
    return null;
  }
}