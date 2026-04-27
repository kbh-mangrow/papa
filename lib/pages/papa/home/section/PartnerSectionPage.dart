
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
    viewportFraction: 0.8,
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
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 4,
              right: 4,
              top: 4,
              bottom: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 50,
              height: 20,
              color: Colors.red,
            )
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
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
