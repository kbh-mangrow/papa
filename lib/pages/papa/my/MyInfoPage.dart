
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/pages/papa/my/WithdrawPage.dart';

import '../../../common/Navigation.dart';
import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'MyInfoPage.dart';
//====================================================

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({super.key, });

  @override
  State<MyInfoPage> createState() => MyInfoPageState();
}

class MyInfoPageState extends State<MyInfoPage> {

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
      backgroundColor: Color(0xffF7FAFF),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.papa_my_settings_informaion,
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
              SizedBox(height: 16,),
              Padding(padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
                ),
              child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getLayer(AppLocalizations.of(context)!.papa_my_info_type, '카카오톡'),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 1,
                        color: Color(0xffE5E8EF), ),
                      getLayer(AppLocalizations.of(context)!.papa_my_info_id, 'k_4K!jet_4821687166'),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 1,
                        color: Color(0xffE5E8EF), ),
                      getLayer(AppLocalizations.of(context)!.papa_my_info_name, '홍길동'),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 1,
                        color: Color(0xffE5E8EF), ),
                      getLayer(AppLocalizations.of(context)!.papa_my_info_email, 'bhkim@smt.ai.kr'),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 1,
                        color: Color(0xffE5E8EF), ),
                      getLayer(AppLocalizations.of(context)!.papa_my_info_phone, '010-1234-5678'),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: const Color(0xffF43F5E),
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      Navigation.startPageRight(context, WithdrawPage(), 'withdraw');
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.papa_my_info_withdraw,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }

  Widget getLayer(String key, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 52,
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              key,
              style: const TextStyle(
                color: Color(0xff67758E),
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xff1B2028),
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
          ),
      ],),
    );
  }

}
