
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'RecommendSectionPage.dart';
//====================================================

class RecommendSectionPage extends StatefulWidget {
  const RecommendSectionPage({super.key, });

  @override
  State<RecommendSectionPage> createState() => RecommendSectionPageState();
}

class RecommendSectionPageState extends State<RecommendSectionPage> {
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
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.papa_home_recommend_prod,
                  style: const TextStyle(
                    color: Color(0xff1B2028),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: 3,),
                Transform.translate(
                  offset: Offset(0, -3),
                  child: Image.asset(
                    'image/stars.png',
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2,),
            Text(
              AppLocalizations.of(context)!.papa_home_recommend_prod_descr,
              style: const TextStyle(
                color: Color(0x9967758E),
                fontSize: 12,
              ),
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 10,),

            //상품 목록
            Column(
              children: List.generate(items.length, (index) {
                final isLast = index == items.length - 1;

                return Container(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Container(
                                    height: 77,
                                    width: 77,
                                    color: Colors.white,
                                    child: Image.network(
                                      'https://cdn.the-pr.co.kr/news/photo/202504/53285_85849_3942.jpg',
                                      height: 77,
                                      width: 77,
                                      fit: BoxFit.fitHeight,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          'image/img_default.png',
                                          height: 77,
                                          width: 77,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '초중고 인강 askjdksjhfjkshkfjhsdjhfkdjhgkjhdfgkjhfkjh',
                                        style: const TextStyle(
                                            color: Color(0xff1B2028),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        '초중고 인강 askjdksjhfjkshkfjhsdjhfkdjhgkjhdfgkjhfkjh',
                                        style: const TextStyle(
                                          color: Color(0xff67758E),
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16,),
                              ],
                            ),
                            const SizedBox(height: 5),

                            if (!isLast)
                              Container(
                                margin: const EdgeInsets.only(left: 90),
                                color: const Color(0xffeeeeee),
                                height: 1,
                                width: double.infinity,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 20,),
            if (items.length > 2)
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF2F4F7),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: SizedBox(
                          height: 44,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.more,
                              style: const TextStyle(
                                color: Color(0xff2A5CAA),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),


          ],
        ),
      ),
    );

  }

}
