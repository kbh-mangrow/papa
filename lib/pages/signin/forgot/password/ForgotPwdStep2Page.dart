
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:papa/PapaComm.dart';
import '../../../../../Storage.dart';
import '../../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'ForgotPwdStep2Page.dart';
//====================================================

class ForgotPwdStep2Page extends StatefulWidget {
  const ForgotPwdStep2Page({super.key, });

  @override
  State<ForgotPwdStep2Page> createState() => ForgotPwdStep2PageState();
}

class ForgotPwdStep2PageState extends State<ForgotPwdStep2Page> {
  String remainTime = '';
  bool authStatus = false; //재전송
  String authError = '인증번호가 올바르지 않습니다.';

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
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32,),
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.signup_auth_code_guide,
              style: const TextStyle(
                color: Color(0xff1B2028),
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4,),
          Material(
            color: authStatus ? Color(0xff478DFA) : Color(0xff10131A),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                setState(() {
                  //index = 2;
                });
              },
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: Center(
                  child: Text(
                    authStatus ? remainTime : AppLocalizations.of(context)!.signup_retry,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24,),
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.signup_auth_code,
              style: const TextStyle(
                color: Color(0xff1B2028),
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 4,),
          Center(
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: OTPTextFieldV2(
                controller: OtpFieldControllerV2(),
                length: 6,
                autoFocus: true,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 56,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 12,
                style: TextStyle(fontSize: 18),
                onChanged: (pin) {
                  //otpCode = pin;
                },
                onCompleted: (verificationCode) {
                  setState(() {
                    //otpCode = verificationCode;
                  });

                },
              ),
            ),
          ),
          SizedBox(height: 4,),
          (authError.isEmpty) ? SizedBox.shrink()
              : Text(
            authError,
            style: const TextStyle(
              color: Color(0xff1E11D48),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),

        ],
      ),
    );

  }

}
