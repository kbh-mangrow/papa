
import 'dart:math';

import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

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
            height: 188,
            padding: const EdgeInsets.all(0), // 내부 여백
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x297CAAFA),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 140,
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
                            Container(
                              width: 100,
                              height: 26,
                              color: Colors.red,
                            )
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
                          height: 0,
                          color: Colors.blue,
                        )



                      ],
                    ),
                  )
                ],)


              ],
              //미확인알림


            ),
          )
        ],)
      ),
    );

  }

}
