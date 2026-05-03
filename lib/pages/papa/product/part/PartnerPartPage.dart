
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PartnerPartPage.dart';
//====================================================

class PartnerPartPage extends StatefulWidget {
  const PartnerPartPage({super.key, });

  @override
  State<PartnerPartPage> createState() => PartnerPartPageState();
}

class PartnerPartPageState extends State<PartnerPartPage> {
  List<String> items = ['A'];

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
        child: Column(
          children: [
            Material(
              color: const Color(0xffEFF4FD),
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.papa_prod_partner,
                              style: TextStyle(
                                color: Color(0xff111827),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              AppLocalizations.of(context)!.papa_prod_partner_descr,
                              style: TextStyle(
                                color: Color(0xff67758E),
                                fontSize: 14,
                              ),
                            ),
                            //3개 이상인 경우에만 더보기
                            if (items.length > 2)
                              Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 4,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.view,
                                            style: TextStyle(
                                              color: Color(0xff2563EB),
                                              fontSize: 14,
                                              height: 1.0,
                                            ),
                                          ),
                                          SizedBox(width: 3,),
                                          Image.asset(
                                            'image/more_blue.png',
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Image.asset(
                          'image/prod_partner.png',
                          width: 85,
                          height: 85,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            //상품목록
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
            SizedBox(height: 12,),


          ],
        ),
      ),
    );

  }

}
