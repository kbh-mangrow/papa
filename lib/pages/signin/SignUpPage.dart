
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
                            text: ' ($index/4)',
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
                child: getBottomLayout()
              )
            ),
          ),
        ],
      ),
    );

  }

  Widget getBottomLayout() {
    Widget widget;
    if (index == 1) {
      widget = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          color: const Color(0xff478DFA),
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.next,
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
      );
    }
    else {
      widget = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child:
              Material(
                color: const Color(0xffF7FAFF),
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() {
                      if (index == 2) {
                        index = 1;
                      }
                      else if (index == 3) {
                        index = 2;
                      }
                      else {
                        index = 3;
                      }
                    });
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.prev,
                        style: const TextStyle(
                          color: Color(0xff478DFA),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Expanded(child:
              Material(
                color: const Color(0xff478DFA),
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() {
                      if (index == 2) {
                        index = 3;
                      }
                      else if (index == 3) {
                        index = 4;
                      }
                      else {
                        //가입
                      }
                    });

                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        (index == 2 || index == 3) ?
                          AppLocalizations.of(context)!.next :
                        AppLocalizations.of(context)!.complete,
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
          ],
        ),
      );
    }

    return widget;
  }

}
