import 'package:flutter/cupertino.dart';

class Storage {
  static final Storage _instance = Storage._internal();
  Storage._internal();
  factory Storage() { return _instance; }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late BuildContext? context = null;

}