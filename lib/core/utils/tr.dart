import 'package:flowchat/core/state/language/language_change_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../localization/app_localizations.dart';


String tr(WidgetRef ref, String key) {
  final langCode = ref.watch(localeProvider);
  return AppLocalizations.translate(langCode, key);
}