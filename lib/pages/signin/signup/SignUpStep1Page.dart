
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter/services.dart';
import 'package:papa/PapaComm.dart';
import '../../../../Storage.dart';
import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignUpStep1Page.dart';
//====================================================

class SignUpStep1Page extends StatefulWidget {
  const SignUpStep1Page({super.key, });

  @override
  State<SignUpStep1Page> createState() => SignUpStep1PageState();
}

class SignUpStep1PageState extends State<SignUpStep1Page> {
  String idError = 'a';
  String passwordError = '';
  String rePasswordError = '';

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
            AppLocalizations.of(context)!.signup_id,
            style: const TextStyle(
              color: Color(0xff1B2028),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 4,),
        Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xA37CAAFA),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: 12,),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          cursorHeight: 18,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                          ],
                          maxLength: 30,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff1B2028),
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.signup_id_hint,
                            hintStyle: const TextStyle(
                              color: Color(0xff8395B4),
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            counterText: '',
                            contentPadding: const EdgeInsets.only(bottom: 4),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(width: 12,),
              ],
            )
        ),
        //아아디 에러
        (idError.isEmpty) ? SizedBox.shrink()
        : Text(
          idError,
          style: const TextStyle(
            color: Color(0xff1E11D48),
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 24,),
        //비밀번호
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.signup_password,
            style: const TextStyle(
              color: Color(0xff1B2028),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 4,),
        Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xA37CAAFA),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: 12,),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Center(
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          cursorHeight: 18,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                          ],
                          maxLength: 30,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff1B2028),
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.signup_password_hint,
                            hintStyle: const TextStyle(
                              color: Color(0xff8395B4),
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            counterText: '',
                            contentPadding: const EdgeInsets.only(bottom: 4),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(width: 12,),
              ],
            )
        ),
        //비밀번호 에러
        (passwordError.isEmpty) ? SizedBox.shrink()
            : Text(
          passwordError,
          style: const TextStyle(
            color: Color(0xff1E11D48),
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12,),
        Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xA37CAAFA),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: 12,),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Center(
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          cursorHeight: 18,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                          ],
                          maxLength: 30,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff1B2028),
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.signup_password_re_hint,
                            hintStyle: const TextStyle(
                              color: Color(0xff8395B4),
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            counterText: '',
                            contentPadding: const EdgeInsets.only(bottom: 4),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(width: 12,),
              ],
            )
        ),
        //비밀번호 확인 에러
        (rePasswordError.isEmpty) ? SizedBox.shrink()
            : Text(
          rePasswordError,
          style: const TextStyle(
            color: Color(0xff1E11D48),
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),


      ],),
    );
  }

}
