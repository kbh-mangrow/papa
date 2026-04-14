
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../l10n/app_localizations.dart';

class UIBuild {
  static Widget materialApp({
    required String title,
    required Locale locale,
    required GlobalKey<NavigatorState> navigatorKey,
    required Widget home,
  }) {
    return MaterialApp(
        locale: locale,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en'),
          Locale('ko'),
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