
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

//====================================================
final String tag = 'RecommendSectionPage.dart';
//====================================================

class RecommendSectionPage extends StatefulWidget {
  const RecommendSectionPage({super.key, });

  @override
  State<RecommendSectionPage> createState() => RecommendSectionPageState();
}

class RecommendSectionPageState extends State<RecommendSectionPage> {
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
