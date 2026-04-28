
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'UseServiceSectionPage.dart';
//====================================================

class UseServiceSectionPage extends StatefulWidget {
  const UseServiceSectionPage({super.key, });

  @override
  State<UseServiceSectionPage> createState() => UseServiceSectionPageState();
}

class UseServiceSectionPageState extends State<UseServiceSectionPage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.papa_home_use_service,
              style: const TextStyle(
                color: Color(0xff1B2028),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 2,),
            Text(
              '홍길동' + AppLocalizations.of(context)!.papa_home_use_service_descr,
              style: const TextStyle(
                color: Color(0x9967758E),
                fontSize: 12,
              ),
              textAlign: TextAlign.left,
            ),
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
                        height: 84,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 4,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Container(
                                  height: 72,
                                  width: 100,
                                  color: Colors.white,
                                  child: Image.network(
                                    'https://cdn.the-pr.co.kr/news/photo/202504/53285_85849_3942.jpg',
                                    height: 100,
                                    width: 77,
                                    fit: BoxFit.fitHeight,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'image/img_default.png',
                                        height: 100,
                                        width: 77,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
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
