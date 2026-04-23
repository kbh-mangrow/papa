
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2SafetyPage.dart';
//====================================================

class Rms2SafetyPage extends StatefulWidget {
  const Rms2SafetyPage({super.key, });

  @override
  State<Rms2SafetyPage> createState() => Rms2SafetyPageState();
}

class Rms2SafetyPageState extends State<Rms2SafetyPage> {
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
