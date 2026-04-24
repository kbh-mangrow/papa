
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

//====================================================
final String tag = 'EventSectionPage.dart';
//====================================================

class EventSectionPage extends StatefulWidget {
  const EventSectionPage({super.key, });

  @override
  State<EventSectionPage> createState() => EventSectionPageState();
}

class EventSectionPageState extends State<EventSectionPage> {
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
      height: 140,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );

  }

}
