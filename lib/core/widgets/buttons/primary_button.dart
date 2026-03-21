import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/state/theme/ui_theme_provider.dart';
import 'package:flowchat/theme/base/app_radius.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PrimaryButton extends ConsumerWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final IconData? icon;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height = 45,
    this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btnColor = ref.watch(uiThemeProvider);
    final isDisabled = onPressed == null || isLoading;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style:
            ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              disabledBackgroundColor: btnColor.withValues(alpha: 0.4),
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white.withValues(alpha: 0.4),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
            ).copyWith(
              mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
            ),
        child: isLoading
            ? SizedBox(
                height: AppSpacing.lg,
                width: AppSpacing.lg,
                child: Lottie.asset(AppAssets.loading, height: 30),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Text(
                    text,
                    style:
                        textStyle ??
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: isDisabled
                              ? Colors.white.withValues(alpha: 0.5)
                              : Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
