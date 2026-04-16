import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UiThemeNotifier extends Notifier<Color> {
  @override
  Color build() {
    return const Color.fromARGB(255, 48, 73, 181);
  }

  void changeColor(Color newColor) {
    state = newColor;
  }
}

final uiThemeProvider =
    NotifierProvider<UiThemeNotifier, Color>(UiThemeNotifier.new);