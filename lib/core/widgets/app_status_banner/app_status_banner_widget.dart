import 'dart:ui';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_radius.dart';
import 'package:flutter/material.dart';

class AppStatusBannerWidget extends StatefulWidget {
  final double screenHeight;
  final String message;
  final IconData icon;

  const AppStatusBannerWidget({
    super.key,
    required this.screenHeight,
    required this.message,
    required this.icon,
  });

  @override
  State<AppStatusBannerWidget> createState() => _AppStatusBannerWidgetState();
}

class _AppStatusBannerWidgetState extends State<AppStatusBannerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: AppMotion.mediumLow,
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: AppMotion.enter));

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: AppMotion.decelerate));

    scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: AppMotion.enter));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Positioned(
      top: widget.screenHeight * 0.05,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.xs),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: AppPadding.statusBannerPadding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.sm),

                      color: isDark
                          ? const Color(0xFF1F2937).withValues(
                              alpha: 0.85,
                            ) // bluish dark
                          : const Color(0xFFF3F4F6).withValues(alpha: 0.9),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.black.withValues(alpha: 0.05),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          widget.icon,
                          color: isDark ? Colors.white : Colors.black87,
                          size: 20,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            widget.message,
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
