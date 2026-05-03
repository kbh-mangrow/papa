
import 'package:flutter/material.dart' hide VoidCallback;

import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'WithdrawPage.dart';
//====================================================

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key, });

  @override
  State<WithdrawPage> createState() => WithdrawPageState();
}

class WithdrawPageState extends State<WithdrawPage> {

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
                      AppLocalizations.of(context)!.papa_my_info_withdraw,
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
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffE5E8EF),
              ),


            ],
          ),
        ],
      ),
    );

  }


}
