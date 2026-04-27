
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
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
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
                      child: const SizedBox(
                        width: double.infinity,
                        height: 156,
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
