
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';

//====================================================
final String tag = 'AdsSectionPage.dart';
//====================================================

class AdsSectionPage extends StatefulWidget {
  const AdsSectionPage({super.key, });

  @override
  State<AdsSectionPage> createState() => AdsSectionPageState();
}

class AdsSectionPageState extends State<AdsSectionPage> {
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
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 290,
                  color: Colors.white,
                  child: Image.network(
                    'https://cdn.the-pr.co.kr/news/photo/202504/53285_85849_3942.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fitHeight,
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
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.white.withOpacity(0.2),
                    highlightColor: Colors.white.withOpacity(0.08),
                    onTap: () {
                      //광고로 이동
                    },
                  ),
                ),
              ),
            ],)
          ],
        ),
      ),
    );

  }

}
