
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaProdPage.dart';
//====================================================

class PapaProdPage extends StatefulWidget {
  const PapaProdPage({super.key, });

  @override
  State<PapaProdPage> createState() => PapaProdPageState();
}

class PapaProdPageState extends State<PapaProdPage> {
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
