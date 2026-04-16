import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/state/theme/ui_theme_provider.dart';
import 'package:flowchat/core/utils/error_presenter.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/buttons/primary_button.dart';
import 'package:flowchat/features/auth/data/model/onboarding_data.dart';
import 'package:flowchat/features/auth/presentation/providers/onboard_provider.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/onboard/onboard_viewmodel.dart';
import 'package:flowchat/features/auth/presentation/widgets/onboarding_content.dart';
import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _controller;
  late OnboardingViewModel vm;
  late TapGestureRecognizer _privacyTap;
  late TapGestureRecognizer _termsTap;

  final int pageCount = 4;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    vm = ref.read(onboardingViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.startAutoSlide(controller: _controller, pageCount: pageCount);
    });

    _privacyTap = TapGestureRecognizer()
      ..onTap = () async {
        final error = await vm.openPrivacyPolicy();

        if (error != null && mounted) {
          ErrorPresenter.show(
            context,
            error.messageKey, // 👈 no tr here
            error,
          );
        }
      };

    _termsTap = TapGestureRecognizer()
      ..onTap = () async {
        final error = await vm.openTermsOfService();

        if (error != null && mounted) {
          ErrorPresenter.show(context, error.messageKey, error);
        }
      };
  }

  void _restartAutoSlide() {
    vm.stopAutoSlide();
    vm.startAutoSlide(controller: _controller, pageCount: pageCount);
  }

  @override
  void dispose() {
    vm.stopAutoSlide();
    _controller.dispose();
    _privacyTap.dispose();
    _termsTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewModelProvider);
    final pages = [
      OnboardingData(
        image: AppAssets.onboardWelcome,
        title: tr(context, "onb_title_1"),
        description: tr(context, "onb_desc_1"),
      ),
      OnboardingData(
        image: AppAssets.onboardSecurity,
        title: tr(context, "onb_title_2"),
        description: tr(context, "onb_desc_2"),
      ),
      OnboardingData(
        image: AppAssets.onboardMeeting,
        title: tr(context, "onb_title_3"),
        description: tr(context, "onb_desc_3"),
      ),
      OnboardingData(
        image: AppAssets.onboardStayConnected,
        title: tr(context, "onb_title_4"),
        description: tr(context, "onb_desc_4"),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanDown: (_) => vm.stopAutoSlide(),
              onPanCancel: () => _restartAutoSlide(),
              onPanEnd: (_) => _restartAutoSlide(),
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  vm.updateIndex(index);
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return OnboardingContent(
                    imagePath: page.image,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),
          ),
      
          /// 🔵 Indicator
          SmoothPageIndicator(
            controller: _controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              expansionFactor: 4,
              spacing: 6,
              activeDotColor: ref.watch(uiThemeProvider),
            ),
          ),
      
          const SizedBox(height: AppSpacing.sm),
      
          /// 🔐 Privacy + Terms
          Padding(
            padding: AppPadding.sm,
            child: IgnorePointer(
              ignoring: state.isOpeningLink,
              child: Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(text: tr(context, "onb_privacy_txt_1")),
                    TextSpan(
                      text: tr(context, "onb_privacy_policy"),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.info,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.info,
                      ),
                      recognizer: _privacyTap,
                    ),
                    TextSpan(text: tr(context, "onb_privacy_txt_2")),
                    TextSpan(
                      text: tr(context, "onb_terms"),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.info,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.info,
                      ),
                      recognizer: _termsTap,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      
          Padding(
            padding: AppPadding.lg,
            child: PrimaryButton(
              text: tr(context, "onb_agreeBtn"),
              onPressed: () {
                vm.onAgree(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
