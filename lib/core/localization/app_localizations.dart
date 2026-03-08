import 'en.dart';
import 'ml.dart';
import 'hi.dart';

class AppLocalizations {
  static Map<String, Map<String, String>> translations = {
    "en": en,
    "ml": ml,
    "hi": hi,
  };

  static String translate(String langCode, String key) {
    return translations[langCode]?[key] ?? key;
  }
}