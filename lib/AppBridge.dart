
import 'dart:convert';

import 'package:papa/JSBridgeInterface.dart';
import 'package:js/js_util.dart' as js_util;

class AppBridge {
  static void sendApp(JSBridgeInterface param) {
    final hasSender = js_util.hasProperty(js_util.globalThis, 'sendToAndroid');
    print('has sendToAndroid: $hasSender');

    if (!hasSender) {
      print('sendToAndroid is not defined');
      return;
    }

    String json = jsonEncode(param.toJson());
    final result = js_util.callMethod(js_util.globalThis, 'sendToAndroid', [json]);
    print('sendToAndroid result: $result');
  }
}