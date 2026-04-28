
import 'dart:math';

import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'WorkDetailPage.dart';
//====================================================

class WorkDetailPage extends StatefulWidget {
  const WorkDetailPage({super.key, });

  @override
  State<WorkDetailPage> createState() => WorkDetailPageState();
}

class WorkDetailPageState extends State<WorkDetailPage> {
  late AppointmentDataSource dataSource;

  @override
  void initState() {
    super.initState();
    dataSource = AppointmentDataSource(getCalendarData());
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
          Container(
            height: 600,
            child: SfCalendar(
              view: CalendarView.month, // 월별 보기
              dataSource: dataSource,

              // 현재 날짜로 이동
              initialDisplayDate: DateTime.now(),
              // 달력 설정
              monthViewSettings: const MonthViewSettings(
                // 1. 점(indicator) 대신 일정 텍스트(appointment)를 직접 표시
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,

                // 2. 한 날짜에 일정이 많을 경우 '...더보기' 텍스트 표시 여부
                showTrailingAndLeadingDates: true,

                // 3. 일정이 표시되는 영역의 스타일 설정
                appointmentDisplayCount: 3, // 한 칸에 최대 몇 개까지 보여줄지 설정
              ),
              // 클릭 이벤트 처리
              onTap: (CalendarTapDetails details) {
                /*
                if (details.targetElement == CalendarElement.appointment) {
                  return;
                }
                 */

                if (details.targetElement == CalendarElement.calendarCell ||
                    details.targetElement == CalendarElement.appointment) {

                  // 일정 박스를 눌러도(appointment), 해당 칸의 날짜(details.date)를 사용합니다.
                  final DateTime clickedDate = details.date!;

                  print("클릭된 날짜: ${clickedDate.year}-${clickedDate.month}-${clickedDate.day}");

                  // 여기서 날짜 클릭 시 동작할 로직(팝업 등)을 작성하세요.
                  final List<dynamic>? appointments = details.appointments;

                  // 콘솔 출력 및 스낵바 알림
                  String msg = "${clickedDate.month}월 ${clickedDate.day}일 클릭됨";
                  if (appointments != null && appointments.isNotEmpty) {
                    msg += " (일정 ${appointments.length}개 있음)";
                  } else {
                    msg += " (일정 없음)";
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(msg), duration: const Duration(seconds: 1)),
                  );
                }

              },
            ),
          ),


        ],
      ),
    );

  }

  List<Appointment> getCalendarData() {
    final List<Appointment> appointments = <Appointment>[];
    final DateTime today = DateTime.now();
    final Random random = Random();

    // 현재 달의 날짜들을 순회하며 더미 데이터 생성 (전후 15일)
    for (int i = -15; i < 15; i++) {
      final DateTime date = today.add(Duration(days: i));

      // 0, 1, 3 중 하나를 랜덤하게 결정
      int countType = random.nextInt(3); // 0, 1, 2 반환
      int appointmentCount = (countType == 0) ? 0 : (countType == 1 ? 1 : 3);

      for (int j = 0; j < appointmentCount; j++) {
        appointments.add(Appointment(
          startTime: DateTime(date.year, date.month, date.day, 9 + j, 0),
          endTime: DateTime(date.year, date.month, date.day, 10 + j, 0),
          subject: '스케줄 ${j + 1}',
          color: _getColor(j),
        ));
      }
    }
    return appointments;
  }

  Color _getColor(int index) {
    if (index == 0) return Colors.blue;
    if (index == 1) return Colors.green;
    return Colors.orange;
  }

}

// 데이터 소스 클래스
class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
