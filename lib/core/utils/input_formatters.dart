import 'package:flutter/services.dart';
import 'package:flowchat/core/constants/regex_patterns.dart';

class NoWhitespaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final originalText = newValue.text;

    /// ✅ Use centralized regex
    final newText = originalText.replaceAll(RegexPatterns.whitespace, '');

    int selectionIndex = newValue.selection.end;

    final removedBeforeCursor = originalText
            .substring(0, selectionIndex)
            .length -
        originalText
            .substring(0, selectionIndex)
            .replaceAll(RegexPatterns.whitespace, '')
            .length;

    selectionIndex -= removedBeforeCursor;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}


//max length formater used in phone number fields------------------------------------------------
class MaxLengthFormatter extends TextInputFormatter {
  final int maxLength;

  MaxLengthFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= maxLength) {
      return newValue;
    }
    return oldValue;
  }
}