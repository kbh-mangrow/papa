
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:lottie/lottie.dart';
import 'package:papa/common/Clipboard.dart';
import 'package:papa/common/FlutterToast.dart';
import 'package:papa/pages/signin/signup/SignUpPage.dart';

import '../../../../common/Navigation.dart';
import '../../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'ForgotPwdResultPage.dart';
//====================================================

class ForgotPwdResultPage extends StatefulWidget {
  const ForgotPwdResultPage({super.key, });

  @override
  State<ForgotPwdResultPage> createState() => ForgotPwdResultPageState();
}

class ForgotPwdResultPageState extends State<ForgotPwdResultPage> {
  String tempPassword = '123456!';

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
                alignment: Alignment.center,
                width: double.infinity,
                height: 52,
                child: Text(
                  AppLocalizations.of(context)!.forgot_pwd_title,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffE5E8EF),
              ),

            ],
          ),
          (tempPassword.isEmpty) ?
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                    'assets/lottie/error.json',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill
                ),
                SizedBox(height: 24,),
                Text(
                  AppLocalizations.of(context)!.forgot_id_result_none,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    color: const Color(0xff478DFA),
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigation.startPageByHome(context, SignUpPage(), 'signup');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.forgot_pwd_signup,
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
                )
              ],
            ),
          ) :
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                    'assets/lottie/safe.json',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill
                ),
                SizedBox(height: 24,),
                Text(
                  AppLocalizations.of(context)!.forgot_pwd_result,
                  style: const TextStyle(
                    color: Color(0xff1B2028),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 24,),
                Text(
                  AppLocalizations.of(context)!.forgot_pwd_result_guide,
                  style: const TextStyle(
                    color: Color(0xff67758E),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context)!.forgot_pwd_temp,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 4,),
                Container(
                    width: double.infinity,
                    height: 48,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
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
                        Image.asset(
                          'image/password.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                tempPassword,
                                style: const TextStyle(
                                  color: Color(0xff1B2028),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: 1,
                          color: Color(0xA37CAAFA),
                        ),
                        Container(
                          width: 48,
                          height: double.infinity,
                          child: Material(
                            color: Color(0xffF7FAFF),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(16),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(16),
                              ),
                              onTap: () {
                                Clipboard.copy(tempPassword);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(AppLocalizations.of(context)!.forgot_pwd_copy),
                                      duration: const Duration(seconds: 1)),
                                );
                                //FlutterToast.show(AppLocalizations.of(context)!.forgot_pwd_copy);
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Center(
                                  child: Image.asset(
                                    'image/copy.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    color: const Color(0xff478DFA),
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.forgot_pwd_signin,
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
                )
              ],
            ),
          ),

          Positioned(
            top: 1,
            right: 1,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Image.asset(
                  'image/close.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),

        ],
      ),
    );

  }


}
