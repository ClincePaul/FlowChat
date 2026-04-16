import 'package:flowchat/core/models/media_option.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_left.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/app_bottom_sheet.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/bottom_sheet_drag_handle.dart';
import 'package:flowchat/core/widgets/bottom_sheets/media/media_option.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flowchat/theme/base/app_icon_sizes.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';

class MediaPickerSheet extends StatelessWidget {
  final List<MediaOptionModel> options;

  const MediaPickerSheet({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Padding(
        padding: AppPadding.sm,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetDragHandle(),
            const SizedBox(height: AppSpacing.xs),

            /// Title
            Row(
              children: [
                const Icon(
                  Icons.photo,
                  size: AppIconSize.iconMd,
                  color: AppColors.gallery,
                ),
                const SizedBox(width: AppSpacing.xs),
                RepaintBoundary(
                  child: StaggeredSlideLeft(
                    delay: 1 * AppMotion.staggerUnit,
                    child: Text(
                      tr(context, "media_choose_photo"),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            /// Options
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: AppSpacing.xl,
                runSpacing: AppSpacing.xl,
                children: options.map((option) {
                  return MediaOption(
                    icon: option.icon,
                    label: option.label,
                    iconColor: option.iconColor,
                    onTap: () {
                      Navigator.pop(context);
                      option.onTap();
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}