
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/common/Archive.dart';
import 'package:papa/pages/papa/my/AlarmPage.dart';
import 'package:papa/pages/papa/my/MyInfoPage.dart';
import 'package:papa/pages/papa/my/TermsPage.dart';
import '../../../Storage.dart';
import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';
import 'PasswordPage.dart';

//====================================================
final String tag = 'PapaMyPage.dart';
//====================================================

class PapaMyPage extends StatefulWidget {
  const PapaMyPage({super.key, });

  @override
  State<PapaMyPage> createState() => PapaMyPageState();
}

class PapaMyPageState extends State<PapaMyPage> {
  List<String> services = ['A', 'B', 'c'];
  String version = '';

  @override
  void initState() {
    super.initState();
    loadVersion();
  }
  void loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7FAFF),
      body: Column(
        children: [
          const SizedBox(height: 11),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(AppLocalizations.of(context)!.papa_my_hello,
                    style: TextStyle(
                      color: Color(0xff8395B4),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Row(children: [
                    Text('홍길동',
                      style: TextStyle(
                        color: Color(0xff0C3766),
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 3,),
                    Text(AppLocalizations.of(context)!.papa_my_name,
                      style: TextStyle(
                          color: Color(0xff0C3766),
                          fontSize: 28,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 12,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF478DFA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'image/car.png',
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            '124가 5465',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),



                  ],),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //RMS II 가 시작화면으로 되어 있는 경우에만 노출
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                      ),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            //택배아빠를 기본화면으로.
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child : Row(
                              children: [
                                Image.asset(
                                  'image/delivery.png',
                                  width: 48,
                                  height: 48,
                                ),
                                SizedBox(width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.papa_my_navi_delivery_status,
                                      style: TextStyle(
                                        color: Color(0xff67758E),
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 2,),
                                    Text(
                                      AppLocalizations.of(context)!.papa_my_navi_delivery_status,
                                      style: TextStyle(
                                          color: Color(0xff111827),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                  ],
                ),
                //이용중인 서비스 (있을수도 없을수도)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.papa_my_use_service,
                        style: TextStyle(
                          color: Color(0xff2A5CAA),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8,),
                      Column(children: List.generate(services.length, (index) {
                        final isFirst = index == 0;
                        final isLast = index == services.length - 1;
                        final isOnlyOne = services.length == 1;

                        final BorderRadius radius = isOnlyOne
                            ? BorderRadius.circular(12)
                            : isFirst
                            ? const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )
                            : isLast
                            ? const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                            : BorderRadius.zero;

                        return Column(
                          children: [
                            Material(
                              color: Colors.white,
                              borderRadius: radius,
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {
                                  print('선택: ${services[index]}');
                                },
                                child: Container(
                                  height: 75,
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'RMS II 안전관리',
                                        style: TextStyle(
                                          color: Color(0xff1B2028),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        '안전관리 스마트 케어 서비스',
                                        style: TextStyle(
                                            color: Color(0xff67758E),
                                            fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                  ],)
                                ),
                              ),
                            ),

                            if (!isLast)
                              Container(
                                height: 1,
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                color: const Color(0xffE5E8EF),
                              ),
                          ],
                        );
                      }),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),

                //설정
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.papa_my_settings,
                        style: TextStyle(
                          color: Color(0xff2A5CAA),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8,),
                      //내정보상세
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigation.startPageRight(context, MyInfoPage(), 'myinfo');
                          },
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'image/settings_user.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .papa_my_settings_informaion,
                                          style: const TextStyle(
                                            color: Color(0xff67758E),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'image/arrow_right.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 1,
                                    margin: const EdgeInsets.only(left: 52),
                                    color: const Color(0xffE5E8EF),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                      //알림설정
                      Material(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigation.startPageRight(context, AlarmPage(), 'alarm');
                            },
                            child: Container(
                              height: 54,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'image/settings_alarm.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context)!.papa_my_settings_alarm,
                                            style: const TextStyle(
                                              color: Color(0xff67758E),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'image/arrow_right.png',
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 1,
                                      margin: const EdgeInsets.only(left: 52),
                                      color: const Color(0xffE5E8EF),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      //비밀번호 변경
                      Material(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: () {
                              Navigation.startPageRight(context, PasswordPage(), 'password');
                            },
                            child: Container(
                              height: 54,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'image/settings_pwd.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context)!.papa_my_settings_change_password,
                                            style: const TextStyle(
                                              color: Color(0xff67758E),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'image/arrow_right.png',
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 1,
                                      margin: const EdgeInsets.only(left: 52),
                                      color: const Color(0xffE5E8EF),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      //가입 약관 및 정책
                      Material(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: InkWell(
                            onTap: () {
                              Navigation.startPageRight(context, TermsPage(), 'terms');
                            },
                            child: Container(
                              height: 54,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'image/settings_terms.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context)!.papa_my_settings_terms,
                                            style: const TextStyle(
                                              color: Color(0xff67758E),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'image/arrow_right.png',
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      //로그아웃
                      SizedBox(height: 20,),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: Container(
                            height: 56,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.papa_my_settings_signout,
                              style: const TextStyle(
                                color: Color(0xff0C3766),
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'v$version',
                          style: const TextStyle(
                            color: Color(0xff67758E),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 50,),


                    ],
                  )
                ),

                SizedBox(height: 100,)
              ],),
            ),
          ),

        ],
      ),
    );

  }

}
