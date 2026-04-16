import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';

class StaggeredSlideFade extends StatefulWidget {
  final Widget child;
  final int delay; // milliseconds

  const StaggeredSlideFade({
    super.key,
    required this.child,
    required this.delay,
  });

  @override
  State<StaggeredSlideFade> createState() => _StaggeredSlideFadeState();
}

class _StaggeredSlideFadeState extends State<StaggeredSlideFade>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3), // slightly below
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: AppMotion.enter,
    ));

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) controller.forward();
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
      child: SlideTransition(
        position: slideAnimation,
        child: widget.child,
      ),
    );
  }
}