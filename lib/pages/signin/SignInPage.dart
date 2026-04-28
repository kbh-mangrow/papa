
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/http/json/JSAuthReq.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import '../../common/Network.dart';
import '../../http/IAuth.dart';
import '../../http/json/JSAuthRes.dart';
import '../common/LoadingOverlay.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
as picker;

//====================================================
final String tag = 'SignInPage.dart';
//====================================================

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, });

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  Offset? _tapPosition;
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
          const SizedBox(height: 56),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.title,
                    style: TextStyle(
                        color: Color(0xff478DFA),
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!.signin_welcome,
                    style: TextStyle(
                        color: Color(0xff111827),
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
          ),



          Row(children: [
            TextButton(
              onPressed: () {
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.KAKAOTALK);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('카카오'),
            ),
            TextButton(
              onPressed: () {
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.GOOGLE);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('구글'),
            ),
            TextButton(
              onPressed: () {
                AppBridge.sendAppx(Constants.SOCIAL_LOGIN, key: Constants.APPLE);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('애플'),
            ),
            TextButton(
              onPressed: () {
                //doAuth();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('본인인증'),
            ),

            Listener(
              onPointerDown: (PointerDownEvent event) {
                _tapPosition = event.position; // ⭐ 터치 좌표 저장
              },
              child: TextButton(
                onPressed: () async {
                  if (_tapPosition == null) return;

                  final selected = await showMenu(
                    context: context,
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder( // ⭐ 핵심
                      borderRadius: BorderRadius.circular(10),
                    ),
                    position: RelativeRect.fromLTRB(
                      _tapPosition!.dx,
                      _tapPosition!.dy,
                      _tapPosition!.dx,
                      _tapPosition!.dy,
                    ),
                    items: [
                      PopupMenuItem(
                        value: 'auth',
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'image/id.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 10,),
                              Text('아이디 찾기'),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'cancel',
                        child: Text('취소'),
                      ),
                    ],
                  );

                  if (selected == 'auth') {
                    print('본인인증 실행');
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('TEST'),
              ),
            )
          ],),

          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                // 1. 내부 콘텐츠 크기에 맞춰 높이가 유연하게 변하도록 설정
                isScrollControlled: true,
                builder: (BuildContext context) {
                  // 2. 내부 위젯이 차지하는 공간을 최소화(wrap_content)
                  return Padding(
                    // 키보드가 올라올 경우를 대비해 하단 여백 추가 (선택사항)
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 중요: 콘텐츠 크기만큼만 높이 차지
                      children: <Widget>[
                        const SizedBox(height: 20),
                        const Text('내용만큼 늘어나는 바텀시트'),
                        const ListTile(
                          leading: Icon(Icons.info),
                          title: Text('콘텐츠 1'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.check),
                          title: Text('콘텐츠 2'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('BottomSheet'),
          ),

          TextButton(
            onPressed: () {
              //https://pub.dev/packages/calendar_date_picker2
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent, // 배경을 투명하게 해야 여백이 보입니다.
                builder: (BuildContext context) {
                  return Container(
                    // 1. 양옆과 하단에 마진을 주어 팝업처럼 띄움
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25), // 전체 모서리 둥글게
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 콘텐츠 크기만큼 (Wrap Content)
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          "날짜 선택",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.single,
                            selectedDayHighlightColor: Colors.blueAccent,
                            // 달력 내부 여백 조절
                            controlsTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: [DateTime.now()],
                          onValueChanged: (dates) => print(dates),
                        ),

                        // 하단 버튼
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("취소"),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("확인", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('달력'),
          ),
          TextButton(
            onPressed: () {
              /*
              //https://pub.dev/packages/flutter_datetime_picker_bdaya
              //DatePickerBdaya.showDateTimePicker(context)
              DatePickerBdaya.showDateTimePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2018, 3, 5),
                  maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.ko);
               */
              /*
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent, // 배경을 투명하게 해야 여백이 보입니다.
                builder: (BuildContext context) {
                  return Container(
                    // 1. 양옆과 하단에 마진을 주어 팝업처럼 띄움
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25), // 전체 모서리 둥글게
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 콘텐츠 크기만큼 (Wrap Content)
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          "날짜 선택",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          width: 350,
                          child: CupertinoCalendar(
                            minimumDateTime: DateTime(2024, 7, 10),
                            maximumDateTime: DateTime(2025, 7, 10),
                            initialDateTime: DateTime(2024, 8, 15, 9, 41),
                            currentDateTime: DateTime(2024, 8, 15),
                            timeLabel: 'Ends',
                            mode: CupertinoCalendarMode.dateTime,
                          ),
                        ),

                        // 하단 버튼
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("취소"),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("확인", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
               */

              picker.DatePicker.showTimePicker(context,
                  showTitleActions: true, onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now());

            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Text('타임피커'),
          ),

          //스케쥴러
          //https://pub.dev/packages/syncfusion_flutter_calendar

        ],
      ),
    );

  }

  Future<void> doAuth() async {
    LoadingOverlay.show(context);
    try {
      final request = JSAuthReq(
        name: "홍길동",
        phoneNumber: "01012345678",
        birth: "19900101",
        gender: "M",
      );

      final response = await IAuth(Network.create()).request(request);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data["code"] == 200) {
          final objx = JSAuthRes.fromJson(response.data);
          print("비즈니스 에러: ${data["message"]}");
        } else {
          print("비즈니스 에러: ${data["message"]}");
        }
      } else {
        print("HTTP 에러");
      }
    } catch (e) {
      print("네트워크 에러: $e");
    }
    finally {
      LoadingOverlay.hide();
    }
  }


}
