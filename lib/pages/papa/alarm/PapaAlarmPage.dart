
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaAlarmPage.dart';
//====================================================

class PapaAlarmPage extends StatefulWidget {
  const PapaAlarmPage({super.key, });

  @override
  State<PapaAlarmPage> createState() => PapaAlarmPageState();
}

class PapaAlarmPageState extends State<PapaAlarmPage> {
  final Map<String, List<String>> sectionData = {
    '오늘': List.generate(3, (i) => '오늘 알림 ${i + 1}'),
    '어제': List.generate(2, (i) => '어제 알림 ${i + 1}'),
    '2026.04.30': List.generate(1, (i) => '그제 알림 ${i + 1}'),
  };


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
    final isEmpty = sectionData.values.every((list) => list.isEmpty);
    return Scaffold(
      backgroundColor: Color(0xffF7FAFF),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            width: double.infinity,
            height: 56,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(AppLocalizations.of(context)!.papa_alarm_title,
                style: TextStyle(
                    color: Color(0xff111827),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            )
          ),
          (isEmpty)
              ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100,),
                Image.asset(
                  'image/alarm_none.png',
                  width: 240,
                  height: 240,
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.papa_alarm_none,
                  style: TextStyle(
                    color: Color(0xff67758E),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ) :
          Expanded(
            child: CustomScrollView(
              slivers: [
                for (final section in sectionData.keys)
                  SliverStickyHeader(
                    header: Container(
                      height: 56,
                      color: const Color(0xffF7FAFF),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 24,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x527CAAFA),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffDCEAFF),
                        ),
                        child: Text(
                          section,
                          style: const TextStyle(
                            color: Color(0xff0C3766),
                            fontSize: 16,
                            height: 1.2
                          ),
                        ),
                      ),
                    ),
                    sliver: SliverList(delegate:
                      SliverChildBuilderDelegate((context, index) {
                          final items = sectionData[section]!;
                          final item = items[index];

                          final isFirst = index == 0;
                          final isLast = index == items.length - 1;
                          final isSingle = items.length == 1;

                          BorderRadius borderRadius;

                          if (isSingle) {
                            borderRadius = BorderRadius.circular(12);
                          } else if (isFirst) {
                            borderRadius = const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            );
                          } else if (isLast) {
                            borderRadius = const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            );
                          } else {
                            borderRadius = BorderRadius.zero;
                          }

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Material(
                              color: Colors.white,
                              borderRadius: borderRadius,
                              child: InkWell(
                                onTap: () {
                                  print('선택됨: $item');
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: getAlarmLayer(0, item) //각 알람 아이템
                                        ),
                                      ),
                                    ),

                                    if (!isLast)
                                      Container(
                                        margin: const EdgeInsets.only(left: 66),
                                        height: 1,
                                        color: const Color(0xffeeeeee),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: sectionData[section]!.length,
                      ),
                    ),
                  ),

              ],
            ),
          ),
          SizedBox(height: 100,),
        ],
      ),
    );

  }

  Widget getAlarmLayer(int type, String text) {
    Widget layer;
    switch (type) {
      case 0: {
        layer = Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 14,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'image/alarm.png',
                    width: 36,
                    height: 36,
                  ),
                  SizedBox(width: 14,),
                  Expanded(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('사고번호 : 260407-A0001',
                          style: TextStyle(
                            color: Color(0xff478DFA),
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4,),
                        Text('자원봉사자 보고서 제출 완료',
                          style: TextStyle(
                            color: Color(0xff111827),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4,),
                        Text(
                          '제출하신 보고서를 검토 중입니다. 검토가 완료되면 알려드리겠습니다.',
                          style: TextStyle(
                            color: Color(0xff67758E),
                            fontSize: 14,
                          ),
                        ),

                      ],
                    )
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 30,
              child: Image.asset(
                'image/indicator.png',
                width: 10,
                height: 10,
              ),
            ),
            Positioned(
              top: 14,
              right: 0,
              child: Text('방금',
                style: TextStyle(
                    color: Color(0xff8395B4),
                    fontSize: 12,
                ),
              ),
            ),
          ],
        );
        break;
      }
      default:
        layer = SizedBox();
    }
    return layer;
  }

}

