
import 'package:flutter/material.dart';

import 'CommonPopup.dart';

class PopupManager {
  static void show(BuildContext context, String title, String message, String? cancel, String ok, Function(int status) callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      CommonPopup.show(
        context,
        title: title,
        message: message,
        cancel: cancel,
        ok: ok,
        onOk: () {
          callback(1);
          },
        onCancel: () { callback(0); },
      );
    });
  }
}