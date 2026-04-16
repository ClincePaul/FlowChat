import 'package:flutter/material.dart';
import 'package:flowchat/theme/base/app_radius.dart';
import 'package:flowchat/theme/base/app_spacing.dart';

class BottomSheetDragHandle extends StatelessWidget {
  const BottomSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
    );
  }
}
