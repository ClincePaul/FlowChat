import 'package:flowchat/features/auth/presentation/viewmodel/sign_up_step_viewmodel.dart';
import 'package:flowchat/features/auth/presentation/widgets/email_step_widget.dart';
import 'package:flowchat/features/auth/presentation/widgets/otp_step_widget.dart';
import 'package:flowchat/features/auth/presentation/widgets/profile_step_widget.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SignUpStep>(signUpStepProvider, (prev, next) {
      if (prev == null) return;

      if (next.index > prev.index) {
        _pageController.nextPage(
          duration: AppMotion.medium,
          curve:AppMotion.emphasized,
        );
      } else {
        _pageController.previousPage(
           duration: AppMotion.medium,
          curve:AppMotion.emphasized,
        );
      }
    });

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          EmailStepWidget(),
          OtpStepWidget(),
          ProfileStepWidget(),
        ],
      ),
    );
  }
}
