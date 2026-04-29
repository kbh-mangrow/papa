
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
  int index = 3;

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
                percent: 1 / index,
                padding: EdgeInsets.zero,
                backgroundColor: Color(0xffeeeeee),
                progressColor: Color(0xff478DFA),
                barRadius: const Radius.circular(0), // 끝부분 둥글게
              ),

              switch (index) {
                3 => const SignUpStep1Page(),
                2 => const SignUpStep2Page(),
                1 => const SignUpStep3Page(),
                _ => const SizedBox(),
              },


            ],
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('확인'),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}
