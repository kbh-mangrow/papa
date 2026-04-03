import 'dart:html' as html;
import 'dart:js' as js;

class System {
  static const String WINDOWS = 'Windows';
  static const String MAC = 'Mac';
  static const String LINUX = 'Linux';
  static const String ANDROID = 'android';
  static const String IOS = 'ios';

  static String getUserAgent() {
    return html.window.navigator.userAgent.toLowerCase();
  }
  static String getOs() {
    String userAgent = html.window.navigator.userAgent.toLowerCase();
    if (userAgent.contains("windows")) {
      return WINDOWS; }
    else if (userAgent.contains("iphone") || userAgent.contains("ipad")) {
      return IOS; }
    else if (userAgent.contains("android")) {
      return ANDROID; }
    else if (userAgent.contains("mac os")) {
      return MAC; }
    else if (userAgent.contains("linux")) {
      return LINUX;
    } else {
      return "Unknown OS";
    }
  }

  static String getBrowserName() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    if (userAgent.contains('edg')) {
      return EDGE;
    } else if (userAgent.contains('opr') || userAgent.contains('opera')) {
      return OPERA;
    } else if (userAgent.contains('chrome') && !userAgent.contains('edge')) {
      return CHROME;
    } else if (userAgent.contains('safari') && !userAgent.contains('chrome')) {
      return SAFARI;
    } else if (userAgent.contains('firefox')) {
      return FIREFOX;
    } else {
      return 'Unknown';
    }
  }
  static Future<bool> isSecretMode() async {
    final result = await js.context.callMethod('isSecretMode');
    return result == true;
  }

  static const String EDGE = 'Edge';
  static const String OPERA = 'Opera';
  static const String CHROME = 'Chrome';
  static const String SAFARI = 'Safari';
  static const String FIREFOX = 'Firefox';

}