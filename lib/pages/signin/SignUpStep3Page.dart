
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignUpStep3Page.dart';
//====================================================

class SignUpStep3Page extends StatefulWidget {
  const SignUpStep3Page({super.key, });

  @override
  State<SignUpStep3Page> createState() => SignUpStep3PageState();
}

class SignUpStep3PageState extends State<SignUpStep3Page> {
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
