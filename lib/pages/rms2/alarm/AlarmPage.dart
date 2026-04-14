
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'AlarmPage.dart';
//====================================================

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key, });

  @override
  State<AlarmPage> createState() => AlarmPageState();
}

class AlarmPageState extends State<AlarmPage> {
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
