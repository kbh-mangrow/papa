import 'LocalStorage.dart';
import 'Preferences.dart';
import 'System.dart';

class WebStorage {
  static Future<void> init() async {
    final userAgent = System.getBrowserName();
    if (userAgent != System.SAFARI) {
      await Preferences.init();
    } else {
      await LocalStorage.init();
    }
  }
  static Future<void> set(String key, String value) async {
    final userAgent = System.getBrowserName();
    if (userAgent != System.SAFARI) {
      await Preferences.set(key, value);
    } else {
      await LocalStorage.set(key, value);
    }
  }
  static String? get(String key) {
    final userAgent = System.getBrowserName();
    if (userAgent != System.SAFARI) {
      return Preferences.get(key);
    } else {
      return LocalStorage.get(key);
    }
  }
}