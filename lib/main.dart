import 'package:flutter/material.dart';

import 'PapaComm.dart';

void main() {
  runApp(const PapaApp());
}

class PapaApp extends StatefulWidget {
  const PapaApp({super.key});

  @override
  State<PapaApp> createState() => PapaAppState();
}

class PapaAppState extends State<PapaApp> {
  Locale locale = const Locale('ko');

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
    return PapaComm.materialApp(
        title: "",
        locale: locale,
        home: Scaffold(
          backgroundColor: Colors.red,
        ),);
  }
}
