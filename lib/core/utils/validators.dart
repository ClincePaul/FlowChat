import 'package:flowchat/core/constants/regex_patterns.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "error_email_empty";
    }

    final regex = RegExp(RegexPatterns.email);

    if (!regex.hasMatch(value)) {
      return "error_invalid_email";
    }

    return null; // valid
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "error_username_empty";
    }

    if (value.length < 2) {
      return "error_username_short";
    }
    if (value.length > 30) {
      return "error_username_long";
    }

    return null;
  }
}
