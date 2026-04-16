import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flowchat/theme/base/app_icon_sizes.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? topLabel; // 👈 new label above field
  final String? errorText;
  final bool obscureText;
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int maxLines;
  final double? height;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;

  const PrimaryTextField({
    super.key,
    this.controller,
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
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.inputFormatters,
    this.onTap, // ✅ added
    this.readOnly = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fillColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade900
        : Colors.grey.shade200;

    final suffixIconColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.grey.shade500;
    final prefixIconColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade500
        : Colors.grey.shade800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null) ...[
          Text(topLabel!, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xs),
        ],

        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          readOnly: readOnly, // ✅ important
          keyboardType: keyboardType,
          focusNode: focusNode,
          textInputAction: textInputAction,
          obscureText: obscureText,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              minHeight: height ?? 42,
              maxHeight: height ?? 42,
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade700,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: AppIconSize.iconXl,
                    color: prefixIconColor
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    size: AppIconSize.iconXl,
                    color: suffixIconColor,
                  )
                : null,

            filled: true,
            fillColor: fillColor,

            contentPadding: AppPadding.textFieldContentPadding,

            errorText: null,
            errorStyle: const TextStyle(height: 0), // hide space
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSpacing.xs,
              ),
              borderSide: BorderSide.none,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSpacing.xs,
              ),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),

        if (errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Padding(
            padding: AppPadding.horizontalxs,
            child: StaggeredSlideFade(
              delay: 0 * AppMotion.staggerUnit,
              child: Text(
                errorText!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
