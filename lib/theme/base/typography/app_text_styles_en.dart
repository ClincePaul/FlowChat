import 'package:flutter/material.dart';
import 'base_text_styles.dart';

class AppTextStylesEn implements BaseTextStyles {
  @override
  TextStyle get displayLarge =>
      const TextStyle(fontSize: 27, fontWeight: FontWeight.bold);

  @override
  TextStyle get headlineLarge =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  TextStyle get headlineMedium =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get headlineSmall =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLarge =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyMedium =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);

  @override
  TextStyle get bodySmall =>
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelLarge =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  @override
  TextStyle get labelMedium =>
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w600);

  @override
  TextStyle get labelSmall =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}