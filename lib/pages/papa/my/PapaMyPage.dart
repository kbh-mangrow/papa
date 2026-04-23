
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaMyPage.dart';
//====================================================

class PapaMyPage extends StatefulWidget {
  const PapaMyPage({super.key, });

  @override
  State<PapaMyPage> createState() => PapaMyPageState();
}

class PapaMyPageState extends State<PapaMyPage> {
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
