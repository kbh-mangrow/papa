
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter_switch/flutter_switch.dart';

import '../../../l10n/app_localizations.dart';


//====================================================
final String tag = 'AlarmPage.dart';
//====================================================

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key, });

  @override
  State<AlarmPage> createState() => AlarmPageState();
}

class AlarmPageState extends State<AlarmPage> {
  bool isAllow = false;
  bool isProd = false;
  bool isNotice = false;
  bool isEtc = false;

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
                      AppLocalizations.of(context)!.papa_my_settings_alarm,
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
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 60,
                        child: Row(
                          children: [
                            Image.asset(
                              'image/tab_alarm_on.png',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.papa_alarm_allow,
                                style: const TextStyle(
                                  color: Color(0xff1B2028),
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: Container(
                                child: FlutterSwitch(
                                  width: 40,
                                  height: 20,
                                  activeColor: Color(0xff10B981),
                                  valueFontSize: 0.0,
                                  toggleSize: 20.0,
                                  value: isAllow,
                                  borderRadius: 10.0,
                                  padding: 1.0,
                                  showOnOff: false,
                                  onToggle: (status) {
                                    setState(() {
                                      isAllow = status;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 52,
                          right: 16,
                        ),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashGapLength: 4.0,
                          dashColor: const Color(0xffE5E8EF),
                        ),
                      ),
                      //혜택알림
                      Container(
                        margin: const EdgeInsets.only(
                          left: 52,
                          right: 16,
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text(
                                  AppLocalizations.of(context)!.papa_alarm_prod,
                                  style: const TextStyle(
                                    color: Color(0xff1B2028),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.papa_alarm_prod_descr,
                                  style: const TextStyle(
                                    color: Color(0xff8395B4),
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],)
                            ),
                            Center(
                              child: Container(
                                child: FlutterSwitch(
                                  width: 40,
                                  height: 20,
                                  activeColor: Color(0xff10B981),
                                  valueFontSize: 0.0,
                                  toggleSize: 20.0,
                                  value: isProd,
                                  borderRadius: 10.0,
                                  padding: 1.0,
                                  showOnOff: false,
                                  onToggle: (status) {
                                    setState(() {
                                      isProd = status;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //새소식 알림
                      Container(
                        margin: const EdgeInsets.only(
                          left: 52,
                          right: 16,
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.papa_alarm_notice,
                                      style: const TextStyle(
                                        color: Color(0xff1B2028),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.papa_alarm_notice_descr,
                                      style: const TextStyle(
                                        color: Color(0xff8395B4),
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],)
                            ),
                            Center(
                              child: Container(
                                child: FlutterSwitch(
                                  width: 40,
                                  height: 20,
                                  activeColor: Color(0xff10B981),
                                  valueFontSize: 0.0,
                                  toggleSize: 20.0,
                                  value: isNotice,
                                  borderRadius: 10.0,
                                  padding: 1.0,
                                  showOnOff: false,
                                  onToggle: (status) {
                                    setState(() {
                                      isNotice = status;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //기타알림
                      Container(
                        margin: const EdgeInsets.only(
                          left: 52,
                          right: 16,
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.papa_alarm_etc,
                                      style: const TextStyle(
                                        color: Color(0xff1B2028),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.papa_alarm_etc_descr,
                                      style: const TextStyle(
                                        color: Color(0xff8395B4),
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],)
                            ),
                            Center(
                              child: Container(
                                child: FlutterSwitch(
                                  width: 40,
                                  height: 20,
                                  activeColor: Color(0xff10B981),
                                  valueFontSize: 0.0,
                                  toggleSize: 20.0,
                                  value: isEtc,
                                  borderRadius: 10.0,
                                  padding: 1.0,
                                  showOnOff: false,
                                  onToggle: (status) {
                                    setState(() {
                                      isEtc = status;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );

  }


}
