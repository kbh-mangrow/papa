import 'dart:convert';
import 'dart:ui' as html hide window;

import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/common/FlutterToast.dart';
import 'package:papa/common/Network.dart';
import 'package:papa/pages/papa/PapaPage.dart';
import 'package:papa/pages/popup/AppOverlayState.dart';
import 'package:papa/pages/rms2/Rms2Page.dart';
import 'dart:html' as html;
import 'Config.dart';
import 'JSBridgeInterface.dart';
import 'dart:js' as js;

import 'PapaComm.dart';


void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NetworkConfig.baseUrl = Config.BASE_URL;

  //from App
  js.context['fromJs'] = (message) {
    if (message != null || !message.isEmpty) {
      final objx = JSBridgeInterface.fromJson(jsonDecode(message));
      switch (objx.command) {
        case Constants.BACK_PRESSED : { //백키 눌림
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

          AppBridge.sendAppx(Constants.FINISH_APP);
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

  //test
  //page = Constants.RMS2;

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
    final Widget page = (widget.page == Constants.RMS2) ? Rms2Page() : PapaPage();
    return PapaComm.deafultLayout(
        home: Builder(
          builder: (buildContext) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: page
            );
          },
        ),
        navigatorKey: widget.navigatorKey
    );
  }
}
