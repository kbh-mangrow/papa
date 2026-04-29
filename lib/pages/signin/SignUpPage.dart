
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter/services.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/signin/SignUpStep1Page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import 'SignUpStep2Page.dart';
import 'SignUpStep3Page.dart';

//====================================================
final String tag = 'SignUpPage.dart';
//====================================================

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, });

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  int index = 1;

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
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.signup_title,
                            style: TextStyle(
                                color: Color(0xff111827),
                                fontSize: 16
                            ),
                          ),
                          TextSpan(
                            text: ' ($index/3)',
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
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
                    /*
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
                 */

                  ],),
              ),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width,
                lineHeight: 4,
                percent: index * 0.25,
                padding: EdgeInsets.zero,
                backgroundColor: Color(0xffeeeeee),
                progressColor: Color(0xff478DFA),
                barRadius: const Radius.circular(0), // 끝부분 둥글게
              ),

              switch (index) {
                1 => const SignUpStep1Page(),
                2 => const SignUpStep2Page(),
                3 => const SignUpStep3Page(),
                _ => const SizedBox(),
              },


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
                child: getNextButton()
              )
            ),
          ),
        ],
      ),
    );

  }

  Widget getNextButton() {
    Widget button;
    if (index == 1) {
      button = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          color: const Color(0xff478DFA),
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              print('click');
            },
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.signin,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    else {
      button = button = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: const Color(0xff478DFA),
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              print('click');
            },
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.signin,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return button;
  }

}
