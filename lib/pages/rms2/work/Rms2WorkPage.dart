
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2WorkPage.dart';
//====================================================

class Rms2WorkPage extends StatefulWidget {
  const Rms2WorkPage({super.key, });

  @override
  State<Rms2WorkPage> createState() => Rms2WorkPageState();
}

class Rms2WorkPageState extends State<Rms2WorkPage> {
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
      backgroundColor: Colors.green,
      body: Column(
        children: [
          const SizedBox(height: 10),

        ],
      ),
    );

  }

}
