
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter/services.dart';
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignUpStep2Page.dart';
//====================================================

class SignUpStep2Page extends StatefulWidget {
  const SignUpStep2Page({super.key, });

  @override
  State<SignUpStep2Page> createState() => SignUpStep2PageState();
}

class SignUpStep2PageState extends State<SignUpStep2Page> {
  String mobileCorp = 'SKT';
  Offset? tapPosition;
  bool isClicked = false;


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
      child: Column(children: [
        SizedBox(height: 32,),
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.signup_name,
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
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                          ],
                          maxLength: 18,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff1B2028),
                          ),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.signup_name_hint,
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
        SizedBox(height: 24,),
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.signup_birth,
            style: const TextStyle(
              color: Color(0xff1B2028),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 4,),
        Row(children: [
          Container(
              width: 90,
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            cursorHeight: 18,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 6,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff1B2028),
                            ),
                            decoration: InputDecoration(
                              hintText: '000000',
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
          SizedBox(width: 8,),
          Text(
            '-',
            style: const TextStyle(
              color: Color(0xff1B2028),
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(width: 8,),
          Container(
              width: 54,
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            cursorHeight: 18,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff1B2028),
                            ),
                            decoration: InputDecoration(
                              hintText: '0',
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
          SizedBox(width: 10,),
          Image.asset(
            'image/dots.png',
            width: 56,
            height: 6,
          ),

        ],),
        SizedBox(height: 24,),
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.signup_mobile,
            style: const TextStyle(
              color: Color(0xff1B2028),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 4,),
        Row(children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: Listener(
              onPointerDown: (event) {
                tapPosition = event.position;
              },
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  if (tapPosition == null) return;

                  setState(() {
                    isClicked = true;
                  });

                  final selected = await showMenu(
                    context: context,
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    position: RelativeRect.fromLTRB(
                      tapPosition!.dx,
                      tapPosition!.dy,
                      tapPosition!.dx,
                      tapPosition!.dy,
                    ),
                    items: [
                      PopupMenuItem(
                        value: 'skt',
                        child: Text(AppLocalizations.of(context)!.signup_skt),
                      ),
                      PopupMenuItem(
                        value: 'kt',
                        child: Text(AppLocalizations.of(context)!.signup_kt),
                      ),
                      PopupMenuItem(
                        value: 'lg',
                        child: Text(AppLocalizations.of(context)!.signup_lg),
                      ),
                      PopupMenuItem(
                        value: 'skt_lite',
                        child: Text(AppLocalizations.of(context)!.signup_skt_lite),
                      ),
                      PopupMenuItem(
                        value: 'kt_lite',
                        child: Text(AppLocalizations.of(context)!.signup_kt_lite),
                      ),
                      PopupMenuItem(
                        value: 'lg_lite',
                        child: Text(AppLocalizations.of(context)!.signup_lg_lite),
                      ),
                    ],
                  );
                  setState(() {
                    isClicked = false;
                  });

                  if (selected != null) {
                    switch (selected) {
                      case 'skt' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_skt;
                        break;
                      }
                      case 'kt' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_kt;
                        break;
                      }
                      case 'lg' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_lg;
                        break;
                      }
                      case 'skt_lite' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_skt_lite;
                        break;
                      }
                      case 'kt_lite' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_kt_lite;
                        break;
                      }
                      case 'lg_lite' : {
                        mobileCorp = AppLocalizations.of(context)!.signup_lg_lite;
                        break;
                      }
                    }
                    print(selected); // 선택값 처리
                  }
                },
                child: Container(
                  width: 160,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xA37CAAFA),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Expanded(
                        child: Center(
                          child: Text(
                            mobileCorp,
                            style: const TextStyle(
                              color: Color(0xff1B2028),
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        isClicked ? 'image/dropdown_up.png' : 'image/dropdown_down.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12,),
          Expanded( child:
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            cursorHeight: 18,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 6,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff1B2028),
                            ),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.signup_mobile_hint,
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

          ),
        ],),


      ],),
    );

  }

}
