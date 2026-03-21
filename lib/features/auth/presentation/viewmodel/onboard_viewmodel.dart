import 'dart:async';
import 'package:flowchat/core/constants/app_urls.dart';
import 'package:flowchat/core/errors/app_error.dart';
import 'package:flowchat/core/errors/exception_mapper.dart';
import 'package:flowchat/core/shared/domain/service/url_service.dart';
import 'package:flowchat/routes/route_paths.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewModel {
  final UrlService
  urlService; //thsi is called dependency injection . this si injected from service locator (sl)
  OnboardingViewModel(this.urlService);

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
          curve: AppMotion.emphasized,
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

  Future<AppError?> openPrivacyPolicy() async {
    try {
      await urlService.openUrl(ApiEndpoints.privacyPolicy);
      return null;
    } catch (e) {
      return ExceptionMapper.map(e);
    }
  }

  Future<AppError?> openTermsOfService() async {
    try {
      await urlService.openUrl(ApiEndpoints.termsOfService);
      return null;
    } catch (e) {
      return ExceptionMapper.map(e);
    }
  }

void onAgree(BuildContext context) {
  context.go(RoutePaths.signup);
}
}
