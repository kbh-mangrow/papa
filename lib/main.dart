import 'dart:convert';
import 'dart:ui' as html hide window;

import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/common/FlutterToast.dart';
import 'package:papa/pages/papa/PapaPage.dart';
import 'package:papa/pages/rms2/Rms2Page.dart';
import 'package:papa/pages/rms2/home/HomePage.dart';
import 'dart:html' as html;
import 'JSBridgeInterface.dart';
import 'PapaComm.dart';
import 'common/GradientButtonStyle.dart';
import 'l10n/app_localizations.dart';
import 'dart:js' as js;

void main() {
  //from App
  js.context['fromJs'] = (message) {
    if (message != null || !message.isEmpty) {
      final objx = JSBridgeInterface.fromJson(jsonDecode(message));
      switch (objx.command) {
        case Constants.BACK_PRESSED : { //백키 눌림
          FlutterToast.show("백키 눌림");
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
  runApp(PapaApp(page: page));
}

class PapaApp extends StatefulWidget {
  final String page;
  const PapaApp({super.key, required this.page});

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
        return PapaComm.deafultLayout(home: Rms2Page());
      }
      default: {
        return PapaComm.deafultLayout(home: PapaPage());
      }
    }
  }
}
