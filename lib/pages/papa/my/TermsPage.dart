
import 'package:flutter/material.dart' hide VoidCallback;

import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'TermsPage.dart';
//====================================================

class TermsPage extends StatefulWidget {
  const TermsPage({super.key, });

  @override
  State<TermsPage> createState() => TermsPageState();
}

class TermsPageState extends State<TermsPage> {

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.papa_my_settings_terms,
                      style: const TextStyle(
                        color: Color(0xff111827),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Positioned(
                      top: 1,
                      left: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'image/prev.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),

                  ],),
              ),

            ],
          ),
        ],
      ),
    );

  }


}
