
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

//====================================================
final String tag = 'PartnerSectionPage.dart';
//====================================================

class PartnerSectionPage extends StatefulWidget {
  const PartnerSectionPage({super.key, });

  @override
  State<PartnerSectionPage> createState() => PartnerSectionPageState();
}

class PartnerSectionPageState extends State<PartnerSectionPage> {
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
