
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/rms2/work/WorkDetailPage.dart';
import '../../../Storage.dart';
import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';
import '../../popup/AppOverlayState.dart';

//====================================================
final String tag = 'Rms2WorkPage.dart';
//====================================================

class Rms2WorkPage extends StatefulWidget {
  const Rms2WorkPage({super.key, });

  @override
  State<Rms2WorkPage> createState() => Rms2WorkPageState();
}

class Rms2WorkPageState extends State<Rms2WorkPage> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),

          Row(children: [
            TextButton(
              onPressed: () {
                Navigation.startPageRight(context, WorkDetailPage());
                AppOverlayState.isDialogOpen = true;
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('근무상세'),
            ),


          ],),
          /*
          Sparkline(
            data: data,
            useCubicSmoothing: true,
            cubicSmoothingFactor: 0.2,
          ),
           */
          //https://pub.dev/packages/chart_sparkline
          Sparkline(
            data: data,
            pointsMode: PointsMode.all,
            pointSize: 8.0,
            pointColor: Colors.amber,
          )

        ],
      ),
    );

  }

}
