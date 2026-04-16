
import 'package:flowchat/theme/base/typography/text_style_factory.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(Locale locale) {
    final styles = TextStyleFactory.getStyles(locale);

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF8FBFF),

      textTheme: TextTheme(
        displayLarge: styles.displayLarge.copyWith(color: Colors.black),

        headlineLarge: styles.headlineLarge.copyWith(color: Colors.black),
        headlineMedium: styles.headlineMedium.copyWith(color: Colors.black),
        headlineSmall: styles.headlineSmall.copyWith(color: Colors.black),

        bodyLarge: styles.bodyLarge.copyWith(color: Colors.black),
        bodyMedium: styles.bodyMedium.copyWith(color: Colors.black),
        bodySmall: styles.bodySmall.copyWith(color: Colors.black),

        labelLarge: styles.labelLarge.copyWith(color: Colors.grey.shade700),
        labelMedium: styles.labelMedium.copyWith(color: Colors.grey.shade600),
        labelSmall: styles.labelSmall.copyWith(color: Colors.grey.shade500),
      ),
    );
  }

  //------------------------------------Dark Theme----------------------------------------------------------

  static ThemeData darkTheme(Locale locale) {
    final styles = TextStyleFactory.getStyles(locale);

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),

      textTheme: TextTheme(
        displayLarge: styles.displayLarge.copyWith(color: Colors.white),

        headlineLarge: styles.headlineLarge.copyWith(color: Colors.white),
        headlineMedium: styles.headlineMedium.copyWith(color: Colors.white),
        headlineSmall: styles.headlineSmall.copyWith(color: Colors.white),

        bodyLarge: styles.bodyLarge.copyWith(color: Colors.white70),
        bodyMedium: styles.bodyMedium.copyWith(color: Colors.white70),
        bodySmall: styles.bodySmall.copyWith(color: Colors.grey),

        labelLarge: styles.labelLarge.copyWith(color: Colors.grey.shade700),
        labelMedium: styles.labelMedium.copyWith(color: Colors.grey.shade600),
        labelSmall: styles.labelSmall.copyWith(color: Colors.grey.shade500),
      ),
    );
  }
}