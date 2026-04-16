import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/buttons/app_icon_button.dart';
import 'package:flowchat/core/widgets/buttons/primary_button.dart';
import 'package:flowchat/core/widgets/text_fields/otp_text_field.dart';
import 'package:flowchat/features/auth/presentation/providers/otp_provider.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_step_provider.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpStepWidget extends ConsumerWidget {
  const OtpStepWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(signUpProvider);
    final otpState = ref.watch(otpProvider);

    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: StaggeredSlideFade(
              delay: 1 * AppMotion.staggerUnit,
              child: AppIconButton(
                icon: Icons.west_outlined,
                onTap: () {
                  ref.read(signUpStepProvider.notifier).back();
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          StaggeredSlideFade(
            delay: 2 * AppMotion.staggerUnit,
            child: Text(
              tr(context, "auth_otp_title"),
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 22),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),
          StaggeredSlideFade(
            delay: 3 * AppMotion.staggerUnit,
            child: Text(
              "${tr(context, "auth_otp_subtitle")} ${formState.email} ",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          /// ✅ New OTP Field
          StaggeredSlideFade(
            delay: 4 * AppMotion.staggerUnit,
            child: SizedBox(
              width: 290,
              child: OtpTextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                length: 5,
                onCompleted: (otp) {
                  final isValid = ref.read(otpProvider.notifier).verifyOtp(otp);

                  if (isValid) {
                    ref.read(signUpStepProvider.notifier).goToProfile();
                  }
                  // You can also send to ViewModel here
                },
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          StaggeredSlideFade(
            delay: 5 * AppMotion.staggerUnit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr(context, "auth_otp_resend_prefix"),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  "${tr(context, "auth_otp_resend_timer")}${otpState.secondsRemaining}s",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.info),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          StaggeredSlideFade(
            delay: 5 * AppMotion.staggerUnit,
            child: PrimaryButton(
              text: tr(context, "auth_otp_resend_button"),
              onPressed: otpState.canResend
                  ? () {
                      ref.read(otpProvider.notifier).resendOtp();
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
