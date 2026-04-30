
import 'package:flutter/material.dart';
import 'package:papa/PapaComm.dart';
import 'package:papa/pages/papa/product/PapaProdPage.dart';
import '../../../Storage.dart';
import '../../../l10n/app_localizations.dart';
import '../../AppBridge.dart';
import '../../Constants.dart';
import '../../JSBridgeInterface.dart';
import '../../common/GradientButtonStyle.dart';
import '../../common/Navigation.dart';
import '../popup/PopupManager.dart';
import '../signin/SignInPage.dart';
import 'alarm/PapaAlarmPage.dart';
import 'home/PapaHomePage.dart';
import 'my/PapaMyPage.dart';

//====================================================
final String tag = 'PapaPage.dart';
//====================================================

class PapaPage extends StatefulWidget {
  const PapaPage({super.key, });

  @override
  State<PapaPage> createState() => PapaPageState();
}

class PapaPageState extends State<PapaPage> {
  int index = 0;
  final List<Widget?> pages = List<Widget?>.filled(4, null, growable: false);

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
        case 0: { page = const PapaHomePage(); break; }
        case 1: { page = const PapaProdPage(); break; }
        case 2: { page = const PapaAlarmPage(); break; }
        case 3: { page = const PapaMyPage(); break; }
        default:
          page = const SizedBox.shrink();
      }
      pages[index] = page;
    }
    return pages[index]!;
  }

  void onClick(int idx) {
    if (index == idx) return;

    if (idx == 3) { //마이
      if (!PapaComm.isSignIn()) {
        PopupManager.show(context,
            AppLocalizations.of(context)!.signin,
            AppLocalizations.of(context)!.popup_signin_confirm,
            AppLocalizations.of(context)!.cancel,
            AppLocalizations.of(context)!.ok, (status) {
              if (status == 1) {
                Navigation.startPageBottom(context, SignInPage(), 'signin');
              }
            });
      }
      else {
        setState(() {
          index = idx;
        });
      }
    }
    else {
      setState(() {
        index = idx;
      });
    }
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
                    label: AppLocalizations.of(context)!.papa_tab_home,
                    selected: index == 0,
                    onTap: () => onClick(0),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.work_rounded,
                    label: AppLocalizations.of(context)!.papa_tab_prod,
                    selected: index == 1,
                    onTap: () => onClick(1),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.safety_check,
                    label: AppLocalizations.of(context)!.papa_tab_alarm,
                    selected: index == 2,
                    onTap: () => onClick(2),
                  ),
                ),
                Expanded(
                  child: Tab(
                    icon: Icons.alarm_rounded,
                    label: AppLocalizations.of(context)!.papa_tab_my,
                    selected: index == 3,
                    onTap: () => onClick(3),
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