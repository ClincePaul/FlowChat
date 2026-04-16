import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/buttons/primary_button.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_step_provider.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountInfoActions extends ConsumerWidget {
  const AccountInfoActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(signUpProvider);

    return Column(
      children: [
        /// Verify Button
        StaggeredSlideFade(
          delay: 7 * AppMotion.staggerUnit,
          child: PrimaryButton(
            text: tr(context, "auth_signup_verify_button"),
            onPressed:
                (formState.emailError == null &&
                    formState.email.isNotEmpty &&
                    formState.userNameError == null &&
                    formState.username.isNotEmpty)
                ? () {
                    ref.read(signUpStepProvider.notifier).goToOtp();
                  }
                : null,
          ),
        ),

        const SizedBox(height: AppSpacing.xxxl),

        /// Divider Text
        StaggeredSlideFade(
          delay: 8 * AppMotion.staggerUnit,
          child: Text(
            tr(context, "auth_signup_divider_text"),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        /// Social Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StaggeredSlideFade(
              delay: 9 * AppMotion.staggerUnit,
              child: Image.asset(AppAssets.googleIcon, width: 45),
            ),
            const SizedBox(width: AppSpacing.md),
            StaggeredSlideFade(
              delay: 9 * AppMotion.staggerUnit,
              child: Image.asset(AppAssets.faceBookIcon, width: 47),
            ),
          ],
        ),
      ],
    );
  }
}
