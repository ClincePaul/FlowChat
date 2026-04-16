import 'package:flowchat/core/widgets/animations/staggered_slide_rotate.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_icon_sizes.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';

class MediaOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;

  const MediaOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: AppPadding.md,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark ? iconColor.withValues(alpha: 0.3) : iconColor.withValues(alpha: 0.3),
              ),
            ),
            child: RepaintBoundary(
              child: StaggeredRotateFadeScale(
                delay: 1 * AppMotion.staggerUnit,
                child: Icon(icon, size: AppIconSize.iconxxl , color:iconColor)),
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
