
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'EventSectionPage.dart';
//====================================================

class EventSectionPage extends StatefulWidget {
  const EventSectionPage({super.key, });

  @override
  State<EventSectionPage> createState() => EventSectionPageState();
}

class EventSectionPageState extends State<EventSectionPage> {
  List<String> items = ['A', 'B', 'C'];

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  AppLocalizations.of(context)!.papa_home_event,
                  style: const TextStyle(
                    color: Color(0xff1B2028),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2,),
                Text(
                  AppLocalizations.of(context)!.papa_home_event_descr,
                  style: const TextStyle(
                    color: Color(0x9967758E),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],),
              Spacer(),
              InkWell(
                child: Container(
                  width: 60,
                  height: 30,
                  child: Text(
                    AppLocalizations.of(context)!.more,
                    style: const TextStyle(
                      color: Color(0xff2563EB),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap:() {

                },
              )

            ],),

            SizedBox(height: 10,),

            //서비스 목록
            Column(
              children: items.map((e) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {

                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 154,
                        child: Column(
                          children: [
                            Container(
                              height: 38,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffDCEAFF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  '🚕 안전지수 80+ 유지 이벤트',
                                  style: const TextStyle(
                                      color: Color(0xff1B2028),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            //contents
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child:
                                      Container(
                                        height: 92,
                                        width: 92,
                                        color: Colors.white,
                                        child: Image.network(
                                          'https://cdn.the-pr.co.kr/news/photo/202504/53285_85849_3942.jpg',
                                          height: 92,
                                          width: 92,
                                          fit: BoxFit.fitHeight,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              'image/img_default.png',
                                              height: 92,
                                              width: 92,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16,),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '초중고 인강 asjh',
                                              style: const TextStyle(
                                                  color: Color(0xff1B2028),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: 80,
                                              height: 32,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0x523B82F6),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(16),
                                                color: Colors.white,
                                              ),
                                              child: Text(
                                                AppLocalizations.of(context)!.join,
                                                style: TextStyle(
                                                  color: Color(0xff0C3766),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 40,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 20,
                                            color: Color(0xffF2F4F7),
                                            child: Text(
                                              '04-01',
                                              style: const TextStyle(
                                                  color: Color(0xff67758E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 4,),
                                          Image.asset(
                                            'image/lines.png',
                                            width: 3,
                                            height: 40,
                                          ),
                                          SizedBox(height: 4,),
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 20,
                                            color: Color(0xffF2F4F7),
                                            child: Text(
                                              '05-01',
                                              style: const TextStyle(
                                                  color: Color(0xff67758E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            )

                          ],
                        )
                      ),
                    ),
                  ),
                );
              }).toList(),
            )

          ],
        ),
      ),
    );

  }

}
