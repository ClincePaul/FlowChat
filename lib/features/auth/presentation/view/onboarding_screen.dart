import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/Buttons/primary_button.dart';
import 'package:flowchat/features/auth/data/model/onboarding_data.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/onboard_viewmodel.dart';
import 'package:flowchat/features/auth/presentation/widgets/onboarding_content.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flowchat/theme/base/app_textstyle.dart';
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
  late OnboardingViewModel onboardViewModel;

  final int pageCount = 4;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    onboardViewModel = OnboardingViewModel();

    /// Start auto slide once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onboardViewModel.startAutoSlide(
        controller: _controller,
        pageCount: pageCount,
      );
    });
  }

  @override
  void dispose() {
    onboardViewModel.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingData(
        image: AppAssets.onboardWelcome,
        title: tr(ref, "onb_title_1"),
        description: tr(ref, "onb_desc_1"),
      ),
      OnboardingData(
        image: AppAssets.onboardSecurity,
        title: tr(ref, "onb_title_2"),
        description: tr(ref, "onb_desc_2"),
      ),
      OnboardingData(
        image: AppAssets.onboardMeeting,
        title: tr(ref, "onb_title_3"),
        description: tr(ref, "onb_desc_3"),
      ),
      OnboardingData(
        image: AppAssets.onboardStayConnected,
        title: tr(ref, "onb_title_4"),
        description: tr(ref, "onb_desc_4"),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onPanDown: (_) => onboardViewModel.stopAutoSlide(),
                onPanCancel: () => onboardViewModel.startAutoSlide(
                  controller: _controller,
                  pageCount: pageCount,
                ),
                onPanEnd: (_) => onboardViewModel.startAutoSlide(
                  controller: _controller,
                  pageCount: pageCount,
                ),
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    onboardViewModel.updateIndex(index);
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
            SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: 4,
                spacing: 6,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),
    const SizedBox(height: AppSpacing.sm,),
 Padding(
  padding: AppPadding.sm,
  child: Text.rich(
    TextSpan(
      style: AppTextStyles.bodyLarge.copyWith(
        fontWeight: FontWeight.w600
      ),
      children: [
        TextSpan(text: tr(ref, "onb_privacy_txt_1")),
        TextSpan(
          text: tr(ref, "onb_privacy_policy"),
          style: AppTextStyles.bodyMedium.copyWith(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
        TextSpan(text: tr(ref, "onb_privacy_txt_2")),
        TextSpan(
          text: tr(ref, "onb_terms"),
          style: AppTextStyles.bodyMedium.copyWith(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  ),
),

            Padding(
              padding: AppPadding.lg,
              child: PrimaryButton(
                text: tr(ref, "onb_agreeBtn"),
                onPressed: () {
                  // onboardViewModel.dispose();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}