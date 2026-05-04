
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter/services.dart';

import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'PasswordPage.dart';
//====================================================

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key, });

  @override
  State<PasswordPage> createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {
  String nowPasswordError = '';
  String newPasswordError = '';
  String newRePasswordError = '';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.papa_my_settings_change_password,
                      style: const TextStyle(
                        color: Color(0xff111827),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Positioned(
                      top: 1,
                      left: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'image/prev.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),

                  ],),
              ),
              Container(
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
                        AppLocalizations.of(context)!.change_password_now,
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
                                        hintText: AppLocalizations.of(context)!.change_password_now_hint,
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
                    //현재 비밀번호 에러
                    (nowPasswordError.isEmpty) ? SizedBox.shrink()
                        : Text(
                      nowPasswordError,
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
                        AppLocalizations.of(context)!.change_password_new,
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
                                        hintText: AppLocalizations.of(context)!.change_password_new_hint,
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
                    //새 비밀번호 에러
                    (newPasswordError.isEmpty) ? SizedBox.shrink()
                        : Text(
                      newPasswordError,
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
                                        hintText: AppLocalizations.of(context)!.change_password_new_re_hint,
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
                    (newRePasswordError.isEmpty) ? SizedBox.shrink()
                        : Text(
                      newRePasswordError,
                      style: const TextStyle(
                        color: Color(0xff1E11D48),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),


                  ],),
              )
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            child: SafeArea(
                top: false,
                child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 3,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        color: const Color(0xff478DFA),
                        borderRadius: BorderRadius.circular(14),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {

                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.ok,
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
                    ),

                )
            ),
          ),
        ],
      ),
    );

  }


}
