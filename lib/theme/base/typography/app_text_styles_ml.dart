import 'package:flutter/material.dart';
import 'base_text_styles.dart';

class AppTextStylesMl implements BaseTextStyles {
  @override
  TextStyle get displayLarge =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

  @override
  TextStyle get headlineLarge =>
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  @override
  TextStyle get headlineMedium =>
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  @override
  TextStyle get headlineSmall =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLarge =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMedium =>
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodySmall =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400);

  @override
  TextStyle get labelLarge =>
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w600);

  @override
  TextStyle get labelMedium =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelSmall =>
      const TextStyle(fontSize: 9, fontWeight: FontWeight.w600);
}