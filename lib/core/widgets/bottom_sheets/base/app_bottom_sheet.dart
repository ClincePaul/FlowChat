import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_radius.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({
    super.key, 
    required this.child,
    });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      top: false,
      child: Container(
        padding: AppPadding.bottomSheetPadding,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? Colors.black : const Color(0xFFF8FBFF),
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.white24 : Colors.black12,
              width: 1.2,
            ),
          ),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        child: child,
      ),
    );
  }
}
