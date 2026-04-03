import 'dart:html' as html;

class Cookie {
  static void saveCookie(String key, String value) {
    final expiryDate = DateTime.now().add(const Duration(days: 30));
    final expiryString = expiryDate.toUtc().toCookieString();
    html.document.cookie = '$key=$value; expires=$expiryString; path=/';
  }
  static String? readCookie(String key) {
    final cookies = html.document.cookie?.split(';');
    if (cookies == null) {
      return null;
    }

    for (var cookie in cookies) {
      final parts = cookie.split('=');
      if (parts.length >= 2) {
        final cookieKey = parts[0].trim();
        if (cookieKey == key) {
          return parts[1].trim();
        }
      }
    }
    return null;
  }
}
extension on DateTime {
  String toCookieString() {
    return '${toUtc().day} ${[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ][month - 1]} $year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} GMT';
  }
}