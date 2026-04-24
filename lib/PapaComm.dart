
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papa/common/UIBuild.dart';

import 'Constants.dart';
import 'common/Date.dart';
import 'l10n/app_localizations.dart';

class PapaComm {
  static Widget deafultLayout({ required Widget home, required GlobalKey<NavigatorState> navigatorKey}) {
    return UIBuild.materialApp(title: "",
                              locale: const Locale(Constants.KO),
                              navigatorKey: navigatorKey,
                              home: home);
  }
  static bool isSignIn() {
    return false;
  }
  static String getWeekDay(BuildContext context, int weekday) {
    var days = [AppLocalizations.of(context)!.mon,
      AppLocalizations.of(context)!.tue,
      AppLocalizations.of(context)!.wed,
      AppLocalizations.of(context)!.thu,
      AppLocalizations.of(context)!.fri,
      AppLocalizations.of(context)!.sat,
      AppLocalizations.of(context)!.sun];
    return days[weekday-1];
  }
  static String getNowWeekDay(BuildContext context) {
    return getWeekDay(context, Date.today().weekday);
  }
}