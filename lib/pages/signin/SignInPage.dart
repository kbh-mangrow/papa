
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/http/json/JSAuthReq.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import '../../common/Network.dart';
import '../../http/IAuth.dart';
import '../../http/json/JSAuthRes.dart';
import '../common/LoadingOverlay.dart';

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
            TextButton(
              onPressed: () {
                doAuth();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('본인인증'),
            ),

          ],)
        ],
      ),
    );

  }

  Future<void> doAuth() async {
    LoadingOverlay.show(context);
    try {
      final request = JSAuthReq(
        name: "홍길동",
        phoneNumber: "01012345678",
        birth: "19900101",
        gender: "M",
      );

      final response = await IAuth(Network.create()).request(request);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data["code"] == 200) {
          final objx = JSAuthRes.fromJson(response.data);
          print("비즈니스 에러: ${data["message"]}");
        } else {
          print("비즈니스 에러: ${data["message"]}");
        }
      } else {
        print("HTTP 에러");
      }
    } catch (e) {
      print("네트워크 에러: $e");
    }
    finally {
      LoadingOverlay.hide();
    }
  }


}
