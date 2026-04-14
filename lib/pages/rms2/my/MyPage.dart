
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'MyPage.dart';
//====================================================

class MyPage extends StatefulWidget {
  const MyPage({super.key, });

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
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
            backgroundColor: Colors.red,
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
