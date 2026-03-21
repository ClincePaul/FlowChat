import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bottomslidetransition {
  static CustomTransitionPage slideFromBottom(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration:  AppMotion.medium,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).chain(CurveTween(curve: AppMotion.enter));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
}