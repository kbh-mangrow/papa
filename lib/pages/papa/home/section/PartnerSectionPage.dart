
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PartnerSectionPage.dart';
//====================================================

class PartnerSectionPage extends StatefulWidget {
  const PartnerSectionPage({super.key, });

  @override
  State<PartnerSectionPage> createState() => PartnerSectionPageState();
}

class PartnerSectionPageState extends State<PartnerSectionPage> {
  List<String> items = ['A', 'B', 'C'];
  final PageController controller = PageController(
    viewportFraction: 0.7,
  );

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
      color: Colors.white,
      height: 330,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              AppLocalizations.of(context)!.papa_home_partner_prod,
              style: const TextStyle(
                color: Color(0xff1B2028),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 2,),
            Text(
              AppLocalizations.of(context)!.papa_home_partner_prod_descr,
              style: const TextStyle(
                color: Color(0x9967758E),
                fontSize: 12,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20,),

            SizedBox(
              height: 230,
              child: PageView.builder(
                controller: controller,
                padEnds: false,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return PageItem(items[index]);
                },
              ),
            ),

          ],
        ),
      ),
    );

  }

  Widget PageItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 4,
                  right: 4,
                  top: 4,
                  bottom: 4,
                ),
                height: 144,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://cdn.the-pr.co.kr/news/photo/202504/53285_85849_3942.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'image/img_default.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 4,
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '메가스터디',
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '초중고 인강 askjdksjhfjkshkfjhsdjhfkdjhgkjhdfgkjhfkjh',
                      style: const TextStyle(
                        color: Color(0xff999999),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Color(0xff343C4A),
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(text: '파트너 제휴'),
                          TextSpan(
                            text: ' 최대 50%',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ),


            ],
          ),
          Positioned(
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 22,
                  child: Image.asset(
                    'image/sticker.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 20,
                  child: Text(
                    '50%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: Colors.white.withOpacity(0.2),
                highlightColor: Colors.white.withOpacity(0.08),
                onTap: () {
                  //광고로 이동
                },
              ),
            ),
          ),


        ],
      )
    );
  }

}
