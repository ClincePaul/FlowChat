import 'package:flowchat/theme/base/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: Colors.black),

      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: Colors.black),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: Colors.black),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(color: Colors.black),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.black87),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.black87),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.black87),

      labelLarge: AppTextStyles.labelLarge.copyWith(color: Colors.grey.shade700),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: Colors.grey.shade600),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: Colors.grey.shade500),
     
    ),
  );

//------------------------------------Dark Theme----------------------------------------------------------

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: Colors.white),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: Colors.white),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(color: Colors.black),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white70),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.grey.shade700),

      labelLarge: AppTextStyles.labelLarge.copyWith(color: Colors.grey.shade700),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: Colors.grey.shade600),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: Colors.grey.shade500),
    ),
  );
}
