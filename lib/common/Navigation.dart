
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation {

  static void startPageBottom(BuildContext context, Widget page, String name) {
    Navigator.push(context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(name: '/${name}'),
      ),
    );
  }

  static void startPageRight(BuildContext context, Widget page, String name) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(name: '/${name}'),
      ),
    );
  }
  static void startPageFade(BuildContext context, Widget page, String name) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );

          return FadeTransition(
            opacity: curved,
            child: child,
          );
        },
        settings: RouteSettings(name: '/${name}'),
      ),
    );
  }

  static void startPageNoAnimation(BuildContext context, Widget page, String name) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        settings: RouteSettings(name: '/${name}'),
      ),
    );
  }
  static void homePage(BuildContext context) {
    Navigator.popUntil(
      context, (route) => route.isFirst,
    );
  }
  static void startPageByHome(BuildContext context, Widget page, String name) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(name: '/${name}'),
      ),
          (route) => route.isFirst,
    );
  }
}