import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Zoomintransition {
  static CustomTransitionPage zoom(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: AppMotion.mediumLow,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        final scaleTween = Tween<double>(
          begin: 0.92,
          end: 1.0,
        ).chain(CurveTween(curve:AppMotion.enter));

        return ScaleTransition(
          scale: animation.drive(scaleTween),
          child: child,
        );
      },
    );
  }
}