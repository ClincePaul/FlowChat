import 'dart:async';
import 'package:flowchat/core/state/core/core_providers.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/onboard/onboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flowchat/core/constants/app_urls.dart';
import 'package:flowchat/core/errors/app_error.dart';
import 'package:flowchat/core/errors/exception_mapper.dart';
import 'package:flowchat/core/shared/domain/service/url_service.dart';
import 'package:flowchat/routes/route_paths.dart';
import 'package:flowchat/theme/animations/app_motion.dart';

class OnboardingViewModel extends Notifier<OnboardingState> {
  late final UrlService urlService;

  Timer? _timer;

  @override
  OnboardingState build() {
    // ✅ Inject dependency here
    urlService = ref.read(urlServiceProvider);

    // ✅ Dispose logic here
    ref.onDispose(() {
      _timer?.cancel();
    });

    return const OnboardingState();
  }

  void startAutoSlide({
    required PageController controller,
    required int pageCount,
  }) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!controller.hasClients) return;

      final nextPage = state.index + 1;

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
    state = state.copyWith(index: newIndex);
  }

 Future<AppError?> openPrivacyPolicy() async {
    if (state.isOpeningLink) return null;
    state = state.copyWith(isOpeningLink: true);
    try {
      await urlService.openUrl(ApiEndpoints.privacyPolicy);
      return null;
    } catch (e) {
      return ExceptionMapper.map(e);
    } finally {
      state = state.copyWith(isOpeningLink: false);
    }
  }

  /// 🌐 Open Terms
  Future<AppError?> openTermsOfService() async {
    if (state.isOpeningLink) return null;

    state = state.copyWith(isOpeningLink: true);

    try {
      await urlService.openUrl(ApiEndpoints.termsOfService);
      return null;
    } catch (e) {
      return ExceptionMapper.map(e);
    } finally {
      state = state.copyWith(isOpeningLink: false);
    }
  }

  void onAgree(BuildContext context) {
    context.go(RoutePaths.signup);
  }
}