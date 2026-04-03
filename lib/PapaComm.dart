
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../Constants.dart';
import '../l10n/app_localizations.dart';

class PapaComm {
  static Widget materialApp({
    required String title,
    required Locale locale,
    required Widget home,
  }) {
    return MaterialApp(
        locale: locale,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale(Constants.EN),
          Locale(Constants.KO),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: title,
        theme: ThemeData(
          fontFamily: 'NotoSans',
        ),
        home: Scaffold(body: Center(child: home,), backgroundColor: Colors.white,)
    );
  }
}