import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static void removeUrlQueryParameters() {
    final uri = Uri.base;
    final cleanUri = Uri(
      scheme: uri.scheme,
      host: uri.host,
      port: uri.port,
      path: uri.path,
    );
    html.window.history.replaceState(null, '', cleanUri.toString());
  }
  static void refreshPage() {
    html.window.location.reload();
  }
  static bool isServiceWorkerActive() {
    return html.window.navigator.serviceWorker?.controller != null;
  }
  static bool isPWA() {
    final displayModeStandalone = html.window.matchMedia('(display-mode: standalone)').matches;
    final isIOSStandalone = js.context.hasProperty('navigator') &&
        js.context['navigator'].hasProperty('standalone') &&
        js.context['navigator']['standalone'] == true;
    return displayModeStandalone || isIOSStandalone;
  }

  static String fingerPrint() {
    final userAgent = html.window.navigator.userAgent;
    final language = html.window.navigator.language;
    final platform = html.window.navigator.platform;
    final screenResolution =
        "${html.window.screen?.width}x${html.window.screen?.height}";
    final timezone = DateTime.now().timeZoneName;

    final rawString =
        "$userAgent|$language|$platform|$screenResolution|$timezone";

    // SHA256 해시 생성
    final bytes = utf8.encode(rawString);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }
}
