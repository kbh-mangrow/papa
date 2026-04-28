
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
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

          /*
          switch (index) {
            3 => const SignUpStep1Page(),
            2 => const SignUpStep2Page(),
            1 => const SignUpStep3Page(),
            _ => const SizedBox(),
          },
           */
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.signin_id,
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
                  Image.asset(
                    'image/id.png',
                    width: 24,
                    height: 24,
                  ),
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
                              hintText: AppLocalizations.of(context)!.signin_id_hint,
                              hintStyle: const TextStyle(
                                color: Color(0xff8395B4),
                                fontSize: 14,
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


        ],
      ),
      bottomNavigationBar: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('확인'),
              ),
            ),
          ),
        ),
      ),
    );

  }

}
