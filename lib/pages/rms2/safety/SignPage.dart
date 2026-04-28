
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../Storage.dart';
import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignPage.dart';
//====================================================

class SignPage extends StatefulWidget {
  const SignPage({super.key, });

  @override
  State<SignPage> createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

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
          //https://pub.dev/packages/syncfusion_flutter_signaturepad
          Container(
            child: SfSignaturePad(
              key: _signaturePadKey,
              backgroundColor: Colors.grey[200],
            ),
            height: 200,
            width: 300,
          ),

          TextButton(
            onPressed: () async  {
              final image = await _signaturePadKey.currentState!.toImage();
              print("");
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('저장'),
          ),

        ],
      ),
    );

  }

}
