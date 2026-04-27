
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../AppBridge.dart';
import '../../../Constants.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2HomePage.dart';
//====================================================

class Rms2HomePage extends StatefulWidget {
  const Rms2HomePage({super.key, });

  @override
  State<Rms2HomePage> createState() => Rms2HomePageState();
}

class Rms2HomePageState extends State<Rms2HomePage> {
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
          TextButton(
            onPressed: () {
              AppBridge.sendAppx(Constants.OPEN_VIEW, key: Constants.DELIVERY);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('택배아빠로'),
          ),
        ],
      ),
    );
  }

}
