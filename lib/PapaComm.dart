
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papa/common/UIBuild.dart';

import 'Constants.dart';

class PapaComm {
  static Widget deafultLayout({ required Widget home, required GlobalKey<NavigatorState> navigatorKey}) {
    return UIBuild.materialApp(title: "",
                              locale: const Locale(Constants.KO),
                              navigatorKey: navigatorKey,
                              home: home);
  }
}