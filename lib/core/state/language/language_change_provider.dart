import 'package:flutter_riverpod/legacy.dart';

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier() : super("en");

  void changeLanguage(String code) {
    state = code;
  }
}

final localeProvider =
    StateNotifierProvider<LocaleNotifier, String>((ref) {
  return LocaleNotifier();
});