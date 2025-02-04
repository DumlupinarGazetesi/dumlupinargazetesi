import 'package:flutter/material.dart';

class Navigation {
  static Future<T?> _slideNavigator<T>(
    BuildContext context,
    Widget page,
    Offset begin,
    Offset end,
    Duration duration,
    Curve curve, {
    bool? isRootNavigator,
  }) {
    return Navigator.of(context, rootNavigator: isRootNavigator ?? true).push<T?>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: duration,
      ),
    );
  }

  static Future bottomToTop(BuildContext context, Widget page,
      {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.ease, bool? isRootNavigator}) {
    return _slideNavigator(context, page, const Offset(0.0, 1.0), Offset.zero, duration, curve,
        isRootNavigator: isRootNavigator);
  }

  static Future rightToLeft(BuildContext context, Widget page,
      {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.ease, bool? isRootNavigator}) {
    return _slideNavigator(context, page, const Offset(1.0, 0.0), Offset.zero, duration, curve,
        isRootNavigator: isRootNavigator);
  }
}
