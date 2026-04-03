import 'package:flutter/material.dart';
import 'package:papa/Constants.dart';

import 'PapaComm.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const PapaApp());
}

class PapaApp extends StatefulWidget {
  const PapaApp({super.key});

  @override
  State<PapaApp> createState() => PapaAppState();
}

class PapaAppState extends State<PapaApp> {
  Locale locale = const Locale(Constants.KO);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PapaComm.materialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.red,
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
