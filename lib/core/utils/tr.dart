import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

String tr(BuildContext context, String key) {
  final langCode = Localizations.localeOf(context).languageCode;
  return AppLocalizations.translate(langCode, key);
}
