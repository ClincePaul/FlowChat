import 'dart:async';
import 'package:flutter/material.dart';

class OnboardingViewModel {
  Timer? _timer;
  int index = 0;

  void startAutoSlide({
    required PageController controller,
    required int pageCount,
  }) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final nextPage = index + 1;

      if (nextPage < pageCount) {
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      } else {
        controller.jumpToPage(0);
      }
    });
  }

  void stopAutoSlide() {
    _timer?.cancel();
  }

  void updateIndex(int newIndex) {
    index = newIndex;
  }

  void dispose() {
    _timer?.cancel();
  }
}