import 'dart:html' as html;
import 'dart:convert';

class SWMessenger {
  /// Service Worker 메시지 수신
  static void listen(void Function(dynamic message) onMessage) {
    html.window.navigator.serviceWorker?.onMessage.listen((event) {
      dynamic data = event.data;
      try {
        data = jsonDecode(event.data);
      } catch (_) {}
      onMessage(data);
    });
  }

  /// 메시지 전송
  static void postMessage(dynamic message) {
    try {
      final safeMessage = jsonEncode(message);
      html.window.navigator.serviceWorker?.controller?.postMessage(safeMessage);
      print('[SWMessenger] message sent: $safeMessage');
    } catch (e) {
      print('[SWMessenger] ERROR: $e');
    }
  }
}