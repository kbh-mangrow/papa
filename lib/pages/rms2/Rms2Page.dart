import 'package:flutter/material.dart';
import 'package:papa/AppBridge.dart';
import 'package:papa/Constants.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/popup/PopupManager.dart';
import 'package:papa/pages/rms2/alarm/Rms2AlarmPage.dart';
import 'package:papa/pages/rms2/home/Rms2HomePage.dart';
import 'package:papa/pages/rms2/my/Rms2MyPage.dart';
import 'package:papa/pages/rms2/safety/Rms2SafetyPage.dart';
import 'package:papa/pages/rms2/work/Rms2WorkPage.dart';
import 'package:papa/pages/signin/SignInPage.dart';
import '../../../l10n/app_localizations.dart';
import '../../common/Navigation.dart';
import '../popup/CommonPopup.dart';

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
        case 0: { page = const Rms2HomePage(); break; }
        case 1: { page = const Rms2WorkPage(); break; }
        case 2: { page = const Rms2SafetyPage(); break; }
        case 3: { page = const Rms2AlarmPage(); break; }
        case 4: { page = const Rms2MyPage(); break;}
        default:
          page = const SizedBox.shrink();
      }
      pages[index] = page;
    }
    return pages[index]!;
  }

  void onClick(int idx) {
    if (index == idx) return;
    setState(() {
      index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 300), () { //페이지 로딩 완료 전달
      AppBridge.sendAppx(Constants.INITIAL_PAGE);
    });

    return Stack(
      children: [
        Positioned.fill(
          child: getPage(), // 본문
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 84,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 3,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Tab(
                    icon: Icons.home_rounded,
                    label: AppLocalizations.of(context)!.rms2_tab_home,
                    selected: index == 0,
                    onTap: () => onClick(0),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.work_rounded,
                    label: AppLocalizations.of(context)!.rms2_tab_work,
                    selected: index == 1,
                    onTap: () => onClick(1),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.safety_check,
                    label: AppLocalizations.of(context)!.rms2_tab_safety,
                    selected: index == 2,
                    onTap: () => onClick(2),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.alarm_rounded,
                    label: AppLocalizations.of(context)!.rms2_tab_alarm,
                    selected: index == 3,
                    onTap: () => onClick(3),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.person_rounded,
                    label: AppLocalizations.of(context)!.rms2_tab_my,
                    selected: index == 4,
                    onTap: () => onClick(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
        height: double.infinity,
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
