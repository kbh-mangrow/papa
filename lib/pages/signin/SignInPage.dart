
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/http/json/JSAuthReq.dart';
import 'package:papa/pages/signin/SignUpPage.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import '../../common/Navigation.dart';
import '../../common/Network.dart';
import '../../common/System.dart';
import '../../http/IAuth.dart';
import '../../http/json/JSAuthRes.dart';
import '../common/LoadingOverlay.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
as picker;

//====================================================
final String tag = 'SignInPage.dart';
//====================================================

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, });

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  bool isSaved = false; //아이디 저장
  bool isClicked = false; //팝업
  bool isVisible = false; //비밀번호 보기
  Offset? tapPosition;

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
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(height: 76),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.title,
                          style: TextStyle(
                              color: Color(0xff478DFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 36
                          ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.signin_welcome,
                          style: TextStyle(
                              color: Color(0xff111827),
                              fontWeight: FontWeight.w600,
                              fontSize: 24
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 52),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                child: Column(
                    children: [
                      //아이디
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
                      SizedBox(height: 20,),

                      //비밀번호
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          AppLocalizations.of(context)!.signin_password,
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
                                'image/password.png',
                                width: 24,
                                height: 24,
                              ),
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
                                        maxLengthEnforcement: MaxLengthEnforcement.enforced, // ⭐ 이거 추가
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff1B2028),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)!.signin_password_hint,
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
                      SizedBox(height: 10,),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                          },
                          child: Container(
                            height: 40,
                            child: Row(children: [
                              Image.asset(
                                isSaved ?
                                'image/check_on.png' : 'image/check_off.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(width: 8,),
                              Text(
                                AppLocalizations.of(context)!.signin_id_save,
                                style: const TextStyle(
                                  color: Color(0xff67758E),
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(width: 5,),
                            ],),
                          ),
                        ),
                        Spacer(),
                        Listener(
                          onPointerDown: (PointerDownEvent event) {
                            tapPosition = event.position;
                          },
                          child: TextButton(
                            onPressed: () async {
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
                                    value: 'find_id',
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'image/user.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(AppLocalizations.of(context)!.signin_forgot_id),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'find_password',
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'image/lock.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(AppLocalizations.of(context)!.signin_forgot_password),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );

                              setState(() {
                                isClicked = false;
                              });

                              if (selected == 'find_id') {
                                print('아이디 찾기 실행');
                              } else if (selected == 'find_password') {
                                print('비밀번호 찾기 실행');
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              foregroundColor: const Color(0xff2563EB),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.signin_forgot,
                                    style: const TextStyle(
                                      color: Color(0xff2563EB),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Image.asset(
                                    isClicked ? 'image/arrow_up.png' : 'image/arrow_down.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],),
                      SizedBox(height: 10,),



                    ]
                )
            ),

            //로그인버튼
            Padding(
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
            ),

            SizedBox(height: 38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 70, height: 1, color: Color(0xffB5BFD2),),
                SizedBox(width: 16,),
                Text(
                  AppLocalizations.of(context)!.signin_social,
                  style: const TextStyle(
                    color: Color(0xff8395B4),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: 16,),
                Container(width: 70, height: 1, color: Color(0xffB5BFD2),),
              ],),
            SizedBox(height: 30,),
            //소셜로그인
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (System.getBrowserName() == System.SAFARI) ?
                  Expanded(
                    child: Material(
                      color: const Color(0xff000000),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.APPLE);
                        },
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'image/apple.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)!.social_apple,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ) :
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Color(0x140C0A09),
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.GOOGLE);
                        },
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'image/google.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)!.social_google,
                                style: const TextStyle(
                                  color: Color(0xff1B2028),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12,),
                  Expanded(
                    child: Material(
                      color: const Color(0xffFEE500),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.KAKAOTALK);
                        },
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'image/kakao.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)!.social_kakao,
                                style: const TextStyle(
                                  color: Color(0xff1B2028),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.signin_first,
                  style: const TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5,),
                InkWell(
                  child: Container(
                      height: 40,
                      child: Center(child: Text(
                        AppLocalizations.of(context)!.signin_signup,
                        style: const TextStyle(
                            color: Color(0xff2563EB),
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        ),
                      ),)
                  ),
                  onTap: () {
                    Navigation.startPageRight(context, SignUpPage());
                  },
                )
              ],)


          ],
        ),
        Positioned(
          top: 7,
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
        )
      ],)
    );

  }

  Future<void> doAuth() async {
    LoadingOverlay.show(context);
    try {
      final request = JSAuthReq(
        name: "홍길동",
        phoneNumber: "01012345678",
        birth: "19900101",
        gender: "M",
      );

      final response = await IAuth(Network.create()).request(request);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data["code"] == 200) {
          final objx = JSAuthRes.fromJson(response.data);
          print("비즈니스 에러: ${data["message"]}");
        } else {
          print("비즈니스 에러: ${data["message"]}");
        }
      } else {
        print("HTTP 에러");
      }
    } catch (e) {
      print("네트워크 에러: $e");
    }
    finally {
      LoadingOverlay.hide();
    }
  }


}
