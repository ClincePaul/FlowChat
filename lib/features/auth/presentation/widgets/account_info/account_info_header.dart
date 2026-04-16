import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';

class AccountInfoHeader extends StatelessWidget {
  const AccountInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaggeredSlideFade(
          delay: 1 * AppMotion.staggerUnit,
          child: Image.asset(
            AppAssets.appIconTransparent,
            height: 90,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),

        /// Title
        StaggeredSlideFade(
          delay: 2 * AppMotion.staggerUnit,
          child: Text(
            tr(context, "auth_signup_title"),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        /// Subtitle
        StaggeredSlideFade(
          delay: 3 * AppMotion.staggerUnit,
          child: Text(
            tr(context, "auth_signup_subtitle"),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
