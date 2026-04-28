
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2MyPage.dart';
//====================================================

class Rms2MyPage extends StatefulWidget {
  const Rms2MyPage({super.key, });

  @override
  State<Rms2MyPage> createState() => Rms2MyPageState();
}

class Rms2MyPageState extends State<Rms2MyPage> {
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
