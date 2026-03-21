import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Fadeslidetransition {

 static CustomTransitionPage fadeSlide(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.medium,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      final slideTween = Tween(
        begin: const Offset(0.1, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve:AppMotion.enter));

      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(slideTween),
          child: child,
        ),
      );
    },
  );
}

}