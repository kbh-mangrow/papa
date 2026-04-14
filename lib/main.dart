import 'dart:convert';
import 'dart:ui' as html hide window;

import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/common/FlutterToast.dart';
import 'package:papa/pages/papa/PapaPage.dart';
import 'package:papa/pages/popup/AppOverlayState.dart';
import 'package:papa/pages/rms2/Rms2Page.dart';
import 'dart:html' as html;
import 'JSBridgeInterface.dart';
import 'dart:js' as js;


void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //from App
  js.context['fromJs'] = (message) {
    if (message != null || !message.isEmpty) {
      final objx = JSBridgeInterface.fromJson(jsonDecode(message));
      switch (objx.command) {
        case Constants.BACK_PRESSED : { //백키 눌림
          //FlutterToast.show("백키 눌림");
          final navigator = navigatorKey.currentState;
          if (navigator == null) return;

          if (AppOverlayState.isDialogOpen) {
            navigator.pop();
            return;
          }

          if (navigator.canPop()) {
            navigator.pop();
            return;
          }

          JSBridgeInterface params = JSBridgeInterface(
            command: Constants.FINISH_APP,
            data: JSData(),
          );
          AppBridge.sendApp(params);

          break;
        }
        default : {
          break;
        }
      }
    }
  };


  final uri = Uri.parse(html.window.location.href);
  String page = uri.queryParameters['page'] ?? '';
  runApp(PapaApp(page: page, navigatorKey: navigatorKey));
}

class PapaApp extends StatefulWidget {
  final String page;
  final GlobalKey<NavigatorState> navigatorKey;

  const PapaApp({super.key, required this.page, required this.navigatorKey});

  @override
  State<PapaApp> createState() => PapaAppState();
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
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.page) {
      case Constants.RMS2 : {
        return Rms2Page(navigatorKey: widget.navigatorKey);
      }
      default: {
        //return PapaPage(navigatorKey: widget.navigatorKey);
        return Rms2Page(navigatorKey: widget.navigatorKey);
      }
    }
  }
}
