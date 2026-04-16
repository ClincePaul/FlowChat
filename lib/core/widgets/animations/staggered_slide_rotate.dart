import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';

class StaggeredRotateFadeScale extends StatefulWidget {
  final Widget child;
  final int delay; // milliseconds

  const StaggeredRotateFadeScale({
    super.key,
    required this.child,
    required this.delay,
  });

  @override
  State<StaggeredRotateFadeScale> createState() =>
      _StaggeredRotateFadeScaleState();
}

class _StaggeredRotateFadeScaleState
    extends State<StaggeredRotateFadeScale>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> rotationAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curved = CurvedAnimation(
      parent: controller,
      curve: AppMotion.enter, // keep consistency across app
    );

    // 🔁 360° rotation
    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curved);

    // 🌫 Fade in
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curved);

    // 🔍 Slight pop effect
    scaleAnimation = Tween<double>(
      begin: 0.8, // starts slightly smaller
      end: 1,
    ).animate(curved);

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) controller.forward(); // run once
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: RotationTransition(
        turns: rotationAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}