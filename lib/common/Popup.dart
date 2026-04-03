import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Popup.show(context: context,
                      message: AppLocalizations.of(context)!.otp_error, ok: AppLocalizations.of(context)!.ok).then((value) {
                      Log.d(tag, '팝업 응답: $value');
                  });
 */

class Popup {
  static const String OK = 'ok';
  static const String CANCEL = 'cancel';

  static Future<String?> show({
    required BuildContext context,
    String title = '',
    String message = '',
    String? cancel,
    String ok = '',
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: title.isNotEmpty ? Text(title) : const SizedBox(height: 0),
          content: Text(message),
          actions: [
            if (cancel != null)
              TextButton(
                child: Text(cancel),
                onPressed: () => Navigator.of(context).pop(CANCEL),
              ),
            TextButton(
              child: Text(ok),
              onPressed: () => Navigator.of(context).pop(OK),
            ),
          ],
        );
      },
    );
  }
}