
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../Storage.dart';
import '../l10n/app_localizations.dart';

//====================================================
final String tag = 'HomePage.dart';
//====================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key, });

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    return PapaComm.materialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.blue,
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
              ],
            ),
          );
        },
      ),
    );

  }

}
