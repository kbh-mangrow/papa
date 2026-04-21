
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import '../../AppBridge.dart';
import '../../Constants.dart';
import '../../JSBridgeInterface.dart';
import '../../common/GradientButtonStyle.dart';

//====================================================
final String tag = 'PapaPage.dart';
//====================================================

class PapaPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const PapaPage({super.key, required this.navigatorKey});

  @override
  State<PapaPage> createState() => PapaPageState();
}

class PapaPageState extends State<PapaPage> {
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
    return PapaComm.deafultLayout(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF540B73),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  color: Colors.white,
                  width: double.infinity,
                  child: GradientButton(
                    onPressed: () {

                      JSBridgeInterface params = JSBridgeInterface(
                        command: Constants.OPEN_VIEW,
                        data: JSData(key: Constants.RMS2),
                      );
                      AppBridge.sendApp(params);

                    },
                    style: GradientButtonStyle(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      elevation: 0,
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xff1D36F3), Color(0xff1D36F3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    child: Text('send app bridge'),
                  ),
                ),



              ],
            ),
          );
        },
      ),
      navigatorKey: widget.navigatorKey
    );

  }

}
