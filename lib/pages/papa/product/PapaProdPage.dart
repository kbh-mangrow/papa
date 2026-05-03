
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/papa/product/part/EventPartPage.dart';
import 'package:papa/pages/papa/product/part/FinancePartPage.dart';
import 'package:papa/pages/papa/product/part/PartnerPartPage.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'PapaProdPage.dart';
//====================================================

class PapaProdPage extends StatefulWidget {
  const PapaProdPage({super.key, });

  @override
  State<PapaProdPage> createState() => PapaProdPageState();
}

class PapaProdPageState extends State<PapaProdPage> {
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
          Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              width: double.infinity,
              height: 56,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(AppLocalizations.of(context)!.papa_prod_title,
                  style: TextStyle(
                      color: Color(0xff111827),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              )
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 8,),
                FinancePartPage(),
                PartnerPartPage(),
                EventPartPage(),

                SizedBox(height: 100,)
              ],),
            ),
          ),
        ],
      ),
    );

  }

}
