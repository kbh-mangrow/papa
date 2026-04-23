
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaHomePage.dart';
//====================================================

class PapaHomePage extends StatefulWidget {
  const PapaHomePage({super.key, });

  @override
  State<PapaHomePage> createState() => PapaHomePageState();
}

class PapaHomePageState extends State<PapaHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),

        ],
      ),
    );

  }

}
