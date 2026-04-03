import 'dart:convert';
import 'dart:html' as html;

/// Safari와 PWA 간의 통신을 위한 BroadcastChannel 유틸
class BroadcastChannel {
  static html.BroadcastChannel? _channel;

  /// 채널 초기화
  static void init(String channelName, void Function(dynamic message) onMessage) {
    _channel = html.BroadcastChannel(channelName);
    print("채널 생성됨: $_channel");

    _channel?.onMessage.listen((event) {
      dynamic data = event.data;
      try {
        data = jsonDecode(event.data);
      } catch (_) {
        // JSON 디코딩 실패 시 원본 데이터 그대로 전달
      }
      print('[BroadcastChannel] message received: $data');
      onMessage(data);
    });
  }

  /// 메시지 보내기
  static void postMessage(dynamic message) {
    try {
      final safeMessage = jsonEncode(message);
      _channel?.postMessage(safeMessage);
      print('[BroadcastChannel] message sent: $safeMessage');
    } catch (e, st) {
      print('[BroadcastChannel] ERROR: $e\n$st');
    }
  }

  /// 닫기
  static void close() {
    _channel?.close();
    _channel = null;
  }
}