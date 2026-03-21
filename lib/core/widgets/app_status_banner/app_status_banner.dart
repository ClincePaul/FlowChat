import 'package:flowchat/core/widgets/app_status_banner/app_status_banner_widget.dart';
import 'package:flutter/material.dart';

class AppStatusBanner {
  static OverlayEntry? _currentEntry;

  static void show({
    required BuildContext context,
    required String message,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);

    // Remove previous banner if exists
    _currentEntry?.remove();

    final screenHeight = MediaQuery.of(context).size.height;

    final overlayEntry = OverlayEntry(
      builder: (_) => AppStatusBannerWidget(
        screenHeight: screenHeight,
        message: message,
        icon: icon,
      ),
    );

    _currentEntry = overlayEntry;

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      if (_currentEntry == overlayEntry) {
        overlayEntry.remove();
        _currentEntry = null;
      }
    });
  }
}
