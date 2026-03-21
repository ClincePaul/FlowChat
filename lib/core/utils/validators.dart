import 'package:flowchat/core/constants/regex_patterns.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }

    final regex = RegExp(RegexPatterns.email);

    if (!regex.hasMatch(value)) {
      return "Invalid email format";
    }

    return null; // valid
  }


  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username cannot be empty";
    }

    if (value.length < 2) {
      return "Username too short";
    }
    if (value.length > 30) {
      return "Username too long";
    }

    return null;
  }
}
