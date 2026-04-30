
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';
import 'SignPage.dart';

//====================================================
final String tag = 'Rms2SafetyPage.dart';
//====================================================

class Rms2SafetyPage extends StatefulWidget {
  const Rms2SafetyPage({super.key, });

  @override
  State<Rms2SafetyPage> createState() => Rms2SafetyPageState();
}

class Rms2SafetyPageState extends State<Rms2SafetyPage> {
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

          Row(children: [
            TextButton(
              onPressed: () {
                Navigation.startPageRight(context, SignPage(), 'signin');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('싸인'),
            ),


          ],)

        ],
      ),
    );

  }

}
