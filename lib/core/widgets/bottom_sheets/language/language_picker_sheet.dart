import 'package:flowchat/core/constants/languages.dart';
import 'package:flowchat/core/state/language/language_change_provider.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/app_bottom_sheet.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/bottom_sheet_drag_handle.dart';
import 'package:flowchat/theme/base/app_icon_sizes.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LanguagePickerSheet extends ConsumerStatefulWidget {
  const LanguagePickerSheet({super.key});

  @override
  ConsumerState<LanguagePickerSheet> createState() =>
      _LanguagePickerSheetState();
}

class _LanguagePickerSheetState extends ConsumerState<LanguagePickerSheet> {
final languages = supportedLanguages;
  @override
  Widget build(BuildContext context) {
    final selectedLang = ref.watch(localeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBottomSheet(
      child: Padding(
        padding: AppPadding.xs,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetDragHandle(),
            const SizedBox(height: AppSpacing.xs),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MdiIcons.translateVariant, size: AppIconSize.iconXl),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  tr(context, "auth_signup_lang_title"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            /// 🔥 RESPONSIVE LAYOUT
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final crossAxisCount = width > 600 ? 3 : 2;
                  final itemWidth =
                      (width - ((crossAxisCount - 1) * 12)) / crossAxisCount;

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 15,
                      children: languages.map((lang) {
                        final isSelected = selectedLang == lang.code;

                        return SizedBox(
                          width: itemWidth,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(localeProvider.notifier)
                                  .changeLanguage(lang.code);

                              Navigator.pop(context);
                            },

                            child: Container(
                              height: 55,
                              padding: AppPadding.horizontalmd,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.06)
                                    : Colors.white.withValues(alpha: 0.06),

                                borderRadius: BorderRadius.circular(5),

                                border: Border.all(
                                  color: isDark
                                      ? Colors.white38
                                      : Colors.black26,
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lang.name,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      const SizedBox(height: AppSpacing.xxs),
                                      Text(
                                        lang.nativeName,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ],
                                  ),

                                  Icon(
                                    isSelected
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    size: AppIconSize.iconXl,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}
