import 'package:flowchat/core/widgets/animations/animated_entry.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flowchat/theme/base/app_textstyle.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? topLabel; // 👈 new label above field
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int maxLines;
  final double? height;
  final String? errorText;
  final Function(String)? onChanged;

  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.topLabel,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.height,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fillColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade900
        : Colors.grey.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null) ...[
          Text(topLabel!, style: theme.textTheme.titleSmall),
          SizedBox(height: AppSpacing.xs),
        ],

        TextFormField(
          controller: controller,
          onChanged: onChanged, 
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          style: AppTextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              minHeight: height ?? 40,
              maxHeight: height ?? 40,
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey.shade700,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, size: 22, color: theme.iconTheme.color)
                : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,

            filled: true,
            fillColor: fillColor,

            contentPadding: AppPadding.sm,

            errorText: null,
            errorStyle: const TextStyle(height: 0), // hide space
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.xs),
              borderSide: BorderSide.none,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.xs),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),

        if (errorText != null)...[
          SizedBox(height: AppSpacing.sm),
          Padding(
            padding: AppPadding.horizontalxs,
            child: StaggeredSlideFade(
               delay: 0 * AppMotion.staggerUnit,
              child: Text(errorText!, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.error))),
          ),
        ]
      ],
    );
  }
}
