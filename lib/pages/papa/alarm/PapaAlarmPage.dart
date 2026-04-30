
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
    '그제': List.generate(1, (i) => '그제 알림 ${i + 1}'),
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
          
          const SizedBox(height: 10),
          isEmpty
              ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/empty.png',
                  width: 120,
                ),
                const SizedBox(height: 12),
                const Text(
                  '알림이 없습니다',
                  style: TextStyle(
                    color: Color(0xff8395B4),
                    fontSize: 14,
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
                      height: 44,
                      color: const Color(0xffF7FAFF),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        section,
                        style: const TextStyle(
                          color: Color(0xff1B2028),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
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
                                      height: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              color: Color(0xff1B2028),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    if (!isLast)
                                      Container(
                                        margin: const EdgeInsets.only(left: 16),
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

        ],
      ),
    );

  }


}

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  SectionHeaderDelegate({required this.title});

  @override
  double get minExtent => 150;

  @override
  double get maxExtent => 150;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Material(
      color: const Color(0xffF7FAFF), // 배경 확실히
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xff1B2028),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SectionHeaderDelegate oldDelegate) {
    return oldDelegate.title != title;
  }
}