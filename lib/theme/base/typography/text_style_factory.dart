import 'package:flutter/material.dart';
import 'base_text_styles.dart';
import 'app_text_styles_en.dart';
import 'app_text_styles_ml.dart';

class TextStyleFactory {
  static BaseTextStyles getStyles(Locale locale) {
    switch (locale.languageCode) {
      case 'ml':
        return AppTextStylesMl();
      case 'ta':
        return AppTextStylesMl();

      default:
        return AppTextStylesEn();
    }
  }
}
