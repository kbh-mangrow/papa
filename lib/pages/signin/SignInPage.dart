
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignInPage.dart';
//====================================================

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, });

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
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
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.KAKAOTALK);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('카카오'),
            ),
            TextButton(
              onPressed: () {
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.GOOGLE);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('구글'),
            ),
            TextButton(
              onPressed: () {
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.APPLE);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('애플'),
            ),
          ],)
        ],
      ),
    );

  }

}
