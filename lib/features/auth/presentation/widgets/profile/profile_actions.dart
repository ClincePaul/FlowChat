import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/buttons/primary_button.dart';
import 'package:flowchat/features/auth/presentation/providers/profile_provider.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_step_provider.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileActions extends ConsumerWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileViewModelProvider);
    return Column(
      children: [
        StaggeredSlideFade(
          delay: 8 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.md,
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: tr(context, "profile_back_btn"),
                    onPressed: () {
                      ref.read(profileViewModelProvider.notifier).clear();
                      ref.read(signUpStepProvider.notifier).back();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    text: tr(context, "profile_continue_btn"),
                    onPressed:
                        (profile.name.isNotEmpty &&
                            profile.countryCode.isNotEmpty &&
                            profile.phone.isNotEmpty)
                        ? () {
                            // ref.read(signUpStepProvider.notifier).finish();
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
       const SizedBox(height: AppSpacing.xl),
        StaggeredSlideFade(
          delay: 10 * AppMotion.staggerUnit,
          child: Center(
            child: Text(
              tr(context, "profile_skip_btn"),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
