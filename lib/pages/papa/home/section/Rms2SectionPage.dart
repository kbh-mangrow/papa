
import 'dart:math';

import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:papa/Storage.dart';
import 'package:papa/pages/rms2/Rms2Page.dart';

import '../../../../AppBridge.dart';
import '../../../../Constants.dart';
import '../../../../common/Navigation.dart';
import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2SectionPage.dart';
//====================================================

class Rms2SectionPage extends StatefulWidget {
  const Rms2SectionPage({super.key, });

  @override
  State<Rms2SectionPage> createState() => Rms2SectionPageState();
}

class Rms2SectionPageState extends State<Rms2SectionPage> {
  int alarmCount = 3; //미확인 알림

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: Stack(
          children: [ Container(
            height: 200,
            padding: const EdgeInsets.all(0), // 내부 여백
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x297CAAFA),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff05203E),
                          Color(0xff16459D),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //배경
                  Positioned(
                    bottom: -15,
                    right: 0,
                    child: Transform.rotate(
                      angle: -10 * pi / 180,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 350,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x1FFFFFFF),
                          border: Border.all(
                            color: Color(0x1FFFFFFF),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),


                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -30,
                    child: Transform.rotate(
                      angle: 10 * pi / 120,
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 350,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x1FFFFFFF),
                          border: Border.all(
                            color: Color(0x1FFFFFFF),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),


                      ),
                    ),
                  ),

                  //내용
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: 14,
                            bottom: 0,
                          ),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.rms2_title_full,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 0,),
                                Text(
                                  AppLocalizations.of(context)!.rms2_title_descr,
                                  style: const TextStyle(
                                    color: Color(0xffdddddd),
                                    fontSize: 11,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Spacer(),

                            //근무중
                            getStatus(0)

                          ],),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '04:23:45',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        //프로그레스
                        Container(
                          height: 40,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '06:00',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    Text(
                                      '15:00',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ),

                              //슬라이더 백 라인 그리기
                              Positioned(
                                bottom: 5,
                                left: 16,
                                right: 16,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final fullWidth = constraints.maxWidth;
                                    final progress = 0.3;

                                    return SizedBox(
                                      height: 32, // thumb 높이 확보
                                      child: Stack(
                                        clipBehavior: Clip.none, // 바깥으로 나가도 자르지 않음
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height: 4,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0x33ffffff),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(2),
                                              color: const Color(0x33ffffff),
                                            ),
                                          ),

                                          Container(
                                            width: fullWidth * progress,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff307AEF),
                                                  Color(0xff60A5FA),
                                                ],
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            left: (fullWidth * progress) - 12,
                                            top: 3,
                                            child: Image.asset(
                                              'image/thumb.png',
                                              width: 50,
                                              height: 32,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )


                            ],

                          ),
                        )

                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Colors.white.withOpacity(0.2),
                        highlightColor: Colors.white.withOpacity(0.08),
                        onTap: () {
                          //RMS2 로 이동
                          AppBridge.sendAppx(Constants.OPEN_VIEW, key: Constants.RMS2);
                        },
                      ),
                    ),
                  ),
                ],),
                //미확인알림
                Row(children: [
                  SizedBox(width: 10,),
                  Image.asset(
                    'image/bell.png',
                    width: 56,
                    height: 45,
                  ),
                  SizedBox(width: 10,),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Color(0xff343C4A),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(text: AppLocalizations.of(context)!.papa_home_rms2_alarm_format1),
                        TextSpan(
                          text: '$alarmCount' + AppLocalizations.of(context)!.count,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.papa_home_rms2_alarm_format2),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 50,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x523B82F6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0x143B82F6)
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.show,
                          style: const TextStyle(
                            color: Color(0xff0C3766),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ),
                  ),
                  SizedBox(width: 14,)
                ],),
              ],

            ),
          ),


        ],)
      ),
    );

  }

  Widget getStatus(int status) {
    var img = "image/status_green.png";
    var txt = "근무중";
    var bg = Color(0x2487FBDC);
    var color = Color(0xff3BFFCB);

    switch (status) {
      case 0 : {

        break;
      }
    }

    return Container(
      width: 70,
      height: 26,
      decoration: BoxDecoration(
        border: Border.all(
          color: bg,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(14),
        color: bg
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 0,
          ),
          child: Row(
            children: [
              Image.asset(
                img,
                width: 16,
                height: 16,
              ),
              SizedBox(width: 1,),
              Text(
                txt,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

        )
      )

    );
  }
}
