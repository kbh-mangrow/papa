
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignUpStep2Page.dart';
//====================================================

class SignUpStep2Page extends StatefulWidget {
  const SignUpStep2Page({super.key, });

  @override
  State<SignUpStep2Page> createState() => SignUpStep2PageState();
}

class SignUpStep2PageState extends State<SignUpStep2Page> {
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
