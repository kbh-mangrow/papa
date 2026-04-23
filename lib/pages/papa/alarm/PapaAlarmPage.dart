
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaAlarmPage.dart';
//====================================================

class PapaAlarmPage extends StatefulWidget {
  const PapaAlarmPage({super.key, });

  @override
  State<PapaAlarmPage> createState() => PapaAlarmPageState();
}

class PapaAlarmPageState extends State<PapaAlarmPage> {
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
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          const SizedBox(height: 10),

        ],
      ),
    );

  }

}
