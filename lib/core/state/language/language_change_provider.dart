import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleNotifier extends Notifier<String> {
  @override
  String build() => "en";

  void changeLanguage(String code) {
    state = code;
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, String>(LocaleNotifier.new);