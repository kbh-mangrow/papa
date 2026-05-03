
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:papa/common/FlutterToast.dart';
import 'package:papa/pages/papa/home/section/AdsSectionPage.dart';
import 'package:papa/pages/papa/home/section/EventSectionPage.dart';
import 'package:papa/pages/papa/home/section/PartnerSectionPage.dart';
import 'package:papa/pages/papa/home/section/RecommendSectionPage.dart';
import 'package:papa/pages/papa/home/section/Rms2SectionPage.dart';
import 'package:papa/pages/papa/home/section/UseServiceSectionPage.dart';
import '../../../Storage.dart';
import '../../../common/Date.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaHomePage.dart';
//====================================================

class PapaHomePage extends StatefulWidget {
  const PapaHomePage({super.key, });

  @override
  State<PapaHomePage> createState() => PapaHomePageState();
}

class PapaHomePageState extends State<PapaHomePage> {
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
      backgroundColor: Color(0xffF7FAFF),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            child: Row(children: [
              //택배아빠 로고
              Image.asset(
                'image/papa_logo.png',
                width: 45,
                height: 40,
              ),
              const SizedBox(width: 6),

              //사용자 이름 또는 환영합니다.
              PapaComm.isSignIn() ?
                Column(
                  children: [
                    // 로그인 상태 UI
                  ],
                ) :
                InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.papa_home_welcome,
                          style: const TextStyle(
                            color: Color(0xff8395B4),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.papa_home_login,
                          style: const TextStyle(
                            color: Color(0xff8395B4),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const Spacer(),
              //달력
              Container(
                padding: const EdgeInsets.all(0), // 내부 여백
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE5E8EF),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 44, height: 44,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xff13B8DD),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Date.getToday('MM.dd'),
                          style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ),
                    Center(
                      child: Text(
                        PapaComm.getNowWeekDay(context),
                        style: const TextStyle(
                          color: Color(0xff1B2028),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )

                  ],
                ),
              )

            ],),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 16),
                Column(children: [
                  //RMS2
                  Column(children: [ Rms2SectionPage(),
                    SizedBox(height: 30,)
                  ],),
                  //프로모션
                  Column(children: [ AdsSectionPage(),
                    SizedBox(height: 30,)
                  ],),
                  //이용중인서비스
                  Column(children: [ UseServiceSectionPage(),
                    SizedBox(height: 30,)
                  ],),
                  //추천금융상품
                  Column(children: [ RecommendSectionPage(),
                    SizedBox(height: 20,)
                  ],),
                  //파트너제휴혜택
                  Column(children: [ PartnerSectionPage(),
                    SizedBox(height: 10,)
                  ],),
                  //이벤트
                  Column(children: [ EventSectionPage(),
                    SizedBox(height: 20,)
                  ],),
                  //사업자등록번호
                  //============================================================
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ Container(
                            width: double.infinity,
                            height: 1,
                            color: Color(0xffE5E8EF),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            AppLocalizations.of(context)!.common_company_name,
                            style: const TextStyle(
                              color: Color(0xff1B2028),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 14,),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.common_label_business_registration_number,
                              style: const TextStyle(
                                color: Color(0xff1B2028),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              AppLocalizations.of(context)!.common_value_business_registration_number,
                              style: const TextStyle(
                                color: Color(0x8805203E),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.common_label_ecommerce_registration_number,
                              style: const TextStyle(
                                color: Color(0xff1B2028),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              AppLocalizations.of(context)!.common_value_ecommerce_registration_number,
                              style: const TextStyle(
                                color: Color(0x8805203E),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.common_label_ceo_name,
                              style: const TextStyle(
                                color: Color(0xff1B2028),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              AppLocalizations.of(context)!.common_value_ceo_name,
                              style: const TextStyle(
                                color: Color(0x8805203E),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.common_label_phone_number,
                              style: const TextStyle(
                                color: Color(0xff1B2028),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              AppLocalizations.of(context)!.common_value_phone_number,
                              style: const TextStyle(
                                color: Color(0x8805203E),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.common_label_address,
                              style: const TextStyle(
                                color: Color(0xff1B2028),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              AppLocalizations.of(context)!.common_value_address,
                              style: const TextStyle(
                                color: Color(0x8805203E),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],),


                      ],),
                    ),
                  )
                  //============================================================
                ],),
                SizedBox(height: 100,)
              ],),
            ),
          ),


        ],
      ),
    );

  }

}
