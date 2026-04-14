
import 'package:flutter/material.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/rms2/alarm/AlarmPage.dart';
import 'package:papa/pages/rms2/home/HomePage.dart';
import 'package:papa/pages/rms2/my/MyPage.dart';
import 'package:papa/pages/rms2/safety/SafetyPage.dart';
import 'package:papa/pages/rms2/work/WorkPage.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'Rms2Page.dart';
//====================================================

class Rms2Page extends StatefulWidget {
  const Rms2Page({super.key, });

  @override
  State<Rms2Page> createState() => Rms2PageState();
}

class Rms2PageState extends State<Rms2Page> {
  int index = 0;
  final List<Widget?> pages = List<Widget?>.filled(5, null, growable: false);


  @override
  void initState() {
    super.initState();
    pages[0] = getPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getPage() {
    if (pages[index] == null) {
      Widget page;
      switch (index) {
        case 0: { page = const HomePage(); break; }
        case 1: { page = const WorkPage(); break; }
        case 2: { page = const SafetyPage(); break; }
        case 3: { page = const AlarmPage(); break; }
        case 4: { page = const MyPage(); break;}
        default:
          page = const SizedBox.shrink();
      }
      pages[index] = page;
    }
    return pages[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return PapaComm.deafultLayout(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned.fill(
                  child: getPage(), // 본문
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          );
        },
      ),
    );

  }


}

class Tab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const Tab({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF540B73) : Colors.grey;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
