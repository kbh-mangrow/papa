
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:lottie/lottie.dart';
import 'package:papa/pages/signin/signup/SignUpPage.dart';

import '../../../../common/Navigation.dart';
import '../../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'ForgotIdResultPage.dart';
//====================================================

class ForgotIdResultPage extends StatefulWidget {
  const ForgotIdResultPage({super.key, });

  @override
  State<ForgotIdResultPage> createState() => ForgotIdResultPageState();
}

class ForgotIdResultPageState extends State<ForgotIdResultPage> {
  String userId = '';

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
                  AppLocalizations.of(context)!.forgot_id_title,
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
          (userId.isEmpty) ?
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
                              AppLocalizations.of(context)!.forgot_id_signup,
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
                  'assets/lottie/check.json',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill
                ),
                SizedBox(height: 24,),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: userId,
                        style: TextStyle(
                            color: Color(0xff478DFA),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.forgot_id_result('honggil*****'),
                        style: TextStyle(
                            color: Color(0xff111827),
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Text(
                  AppLocalizations.of(context)!.forgot_id_result_guide,
                  style: const TextStyle(
                    color: Color(0xff67758E),
                    fontSize: 14,
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
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.forgot_id_signin,
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
