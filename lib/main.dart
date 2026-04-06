import 'dart:ui' as html;

import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';

import 'JSBridgeInterface.dart';
import 'PapaComm.dart';
import 'common/GradientButtonStyle.dart';
import 'l10n/app_localizations.dart';
import 'dart:js' as js;

void main() {
  runApp(const PapaApp());
  
  js.context['fromJs'] = (message) {
    print('JS에서 받은 메시지: $message');
  };
}

class PapaApp extends StatefulWidget {
  const PapaApp({super.key});

  @override
  State<PapaApp> createState() => PapaAppState();
}

void registerNativeHandler(void Function(String message) onMessage) {
  js_util.setProperty(
    html.window,
    'onNativeMessage',
    js_util.allowInterop((message) {
      onMessage(message?.toString() ?? '');
    }),
  );
}

class PapaAppState extends State<PapaApp> {
  Locale locale = const Locale(Constants.KO);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    registerNativeHandler((message) {
      print('from android: $message');
    });

  }

  @override
  Widget build(BuildContext context) {
    return PapaComm.materialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.red,
            body: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF540B73),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  color: Colors.white,
                  width: double.infinity,
                  child: GradientButton(
                    onPressed: () {

                      JSBridgeInterface params = JSBridgeInterface(
                        command: Constants.OPEN_VIEW,
                        data: JSData(key: Constants.RMS2),
                      );
                      AppBridge.sendApp(params);

                    },
                    style: GradientButtonStyle(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      elevation: 0,
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xff1D36F3), Color(0xff1D36F3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    child: Text('send android'),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );

  }
}
