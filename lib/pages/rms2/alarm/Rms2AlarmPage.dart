
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2AlarmPage.dart';
//====================================================

class Rms2AlarmPage extends StatefulWidget {
  const Rms2AlarmPage({super.key, });

  @override
  State<Rms2AlarmPage> createState() => Rms2AlarmPageState();
}

class Rms2AlarmPageState extends State<Rms2AlarmPage> {
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
