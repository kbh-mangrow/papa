
import 'dart:js' as js;
import 'dart:async';

class WebRtcIP {
  // WebRTC를 통해 IP 주소를 가져오는 메서드
  static Future<List<String>> getIPAddresses() async {
    final completer = Completer<List<String>>();

    // JavaScript 함수 호출
    js.context.callMethod('getIPAddresses', [
      js.allowInterop((List<String> ipAddresses) {
        completer.complete(ipAddresses); // callback에서 받은 값을 complete()
      }),
    ]);

    // 결과를 기다리고 반환
    return completer.future;
  }
}