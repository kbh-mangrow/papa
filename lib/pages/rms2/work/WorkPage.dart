
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'WorkPage.dart';
//====================================================

class WorkPage extends StatefulWidget {
  const WorkPage({super.key, });

  @override
  State<WorkPage> createState() => WorkPageState();
}

class WorkPageState extends State<WorkPage> {
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
    return PapaComm.deafultLayout(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.green,
            body: Column(
              children: [
                const SizedBox(height: 10),

              ],
            ),
          );
        },
      ),
    );

  }

}
