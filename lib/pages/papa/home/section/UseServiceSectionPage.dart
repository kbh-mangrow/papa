
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
                      child: const SizedBox(
                        width: double.infinity,
                        height: 84,
                        child: Row(
                          children: [

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
