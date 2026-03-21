import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/animated_entry.dart';
import 'package:flowchat/core/widgets/buttons/primary_button.dart';
import 'package:flowchat/core/widgets/text_fields/primary_text_field.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/sign_up_step_viewmodel.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/sign_up_viewmodel.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flowchat/theme/base/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmailStepWidget extends ConsumerStatefulWidget {
  const EmailStepWidget({super.key});

  @override
  ConsumerState<EmailStepWidget> createState() => _EmailStepWidgetState();
}

class _EmailStepWidgetState extends ConsumerState<EmailStepWidget> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(signUpProvider);
    return Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.md,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// App Icon
          StaggeredSlideFade(
            delay: 1 * AppMotion.staggerUnit,
            child: Image.asset(
              AppAssets.appIconTransparent,
              height: 100,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),

          /// Title
          StaggeredSlideFade(
            delay: 2 * AppMotion.staggerUnit,
            child: Text(
              tr(ref, "auth_signup_title"),
              style: AppTextStyles.displayLarge,
            ),
          ),

          SizedBox(height: AppSpacing.sm),

          /// Subtitle
          StaggeredSlideFade(
            delay: 3 * AppMotion.staggerUnit,
            child: Text(
              tr(ref, "auth_signup_subtitle"),
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: AppSpacing.xl),

          /// Username Field
          StaggeredSlideFade(
            delay: 4 * AppMotion.staggerUnit,
            child: PrimaryTextField(
              controller: usernameController,
              hintText: tr(ref, "auth_signup_username_hint"),
              topLabel: tr(ref, "auth_signup_username_label"),
              prefixIcon: MdiIcons.account,
              errorText: formState.userNameError,
              onChanged: (value) {
                ref.read(signUpProvider.notifier).onUsernameChanged(value);
              },
            ),
          ),

          SizedBox(height: AppSpacing.lg),

          /// Email Field
          StaggeredSlideFade(
            delay: 5 * AppMotion.staggerUnit,
            child: PrimaryTextField(
              controller: emailController,

              hintText: tr(ref, "auth_signup_email_hint"),
              topLabel: tr(ref, "auth_signup_email_label"),
              prefixIcon: Icons.email,
              errorText: formState.emailError,
              onChanged: (value) {
                ref.read(signUpProvider.notifier).onEmailChanged(value);
              },
            ),
          ),

          const SizedBox(height: AppSpacing.xxl),

          /// Info Text
          StaggeredSlideFade(
            delay: 6 * AppMotion.staggerUnit,
            child: Text(
              tr(ref, "auth_signup_email_info"),
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          /// Verify Button
          StaggeredSlideFade(
            delay: 7 * AppMotion.staggerUnit,
            child: PrimaryButton(
              text: tr(ref, "auth_signup_verify_button"),

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
              tr(ref, "auth_signup_divider_text"),
              style: AppTextStyles.bodyMedium,
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
                child: Image.asset(AppAssets.googleIcon, width: 40),
              ),
              SizedBox(width: AppSpacing.md),
              StaggeredSlideFade(
                delay: 9 * AppMotion.staggerUnit,
                child: Image.asset(AppAssets.faceBookIcon, width: 42),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
