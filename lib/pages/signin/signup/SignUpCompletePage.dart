
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:lottie/lottie.dart';
import 'package:papa/pages/papa/PapaPage.dart';

import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'SignUpComplatePage.dart';
//====================================================

class SignUpComplatePage extends StatefulWidget {
  const SignUpComplatePage({super.key, });

  @override
  State<SignUpComplatePage> createState() => SignUpComplatePageState();
}

class SignUpComplatePageState extends State<SignUpComplatePage> {

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
                  AppLocalizations.of(context)!.signup_title,
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
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lottie/success.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill
                ),
                Text(
                  AppLocalizations.of(context)!.signup_complete,
                  style: const TextStyle(
                    color: Color(0xff111827),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  AppLocalizations.of(context)!.signup_complete_welcome,
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
                        Navigation.homePage(context);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.signup_complete_home,
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
                Navigation.homePage(context);
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
