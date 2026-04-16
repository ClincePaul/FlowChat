import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Zoomintransition {
  static CustomTransitionPage zoom(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: AppMotion.medium,
      reverseTransitionDuration: AppMotion.fast, 
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: AppMotion.enter,       
          reverseCurve: AppMotion.exit,    
        );

        final scaleTween = Tween<double>(
          begin: 0.00,
          end: 1.0,
        );

        return ScaleTransition(
          scale: curvedAnimation.drive(scaleTween),
          child: child,
        );
      },
    );
  }
}