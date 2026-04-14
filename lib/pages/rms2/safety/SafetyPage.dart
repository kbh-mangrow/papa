
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SafetyPage.dart';
//====================================================

class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key, });

  @override
  State<SafetyPage> createState() => SafetyPageState();
}

class SafetyPageState extends State<SafetyPage> {
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
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          const SizedBox(height: 10),

        ],
      ),
    );

  }

}
