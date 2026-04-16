import 'package:flowchat/core/utils/input_formatters.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/text_fields/primary_text_field.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountInfoForm extends ConsumerStatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final FocusNode usernameFocusNode;
  final FocusNode emailFocusNode;

  const AccountInfoForm({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.emailFocusNode,
    required this.usernameFocusNode,
  });

  @override
  ConsumerState<AccountInfoForm> createState() => _AccountInfoFormState();
}

class _AccountInfoFormState extends ConsumerState<AccountInfoForm> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(signUpProvider);

    return Column(
      children: [
        /// Username Field
        StaggeredSlideFade(
          delay: 4 * AppMotion.staggerUnit,
          child: PrimaryTextField(
            controller: widget.usernameController,
            focusNode: widget.usernameFocusNode,
            inputFormatters: [NoWhitespaceFormatter()],
            hintText: tr(context, "auth_signup_username_hint"),
            topLabel: tr(context, "auth_signup_username_label"),
            prefixIcon: MdiIcons.account,
            errorText: formState.userNameError != null
                ? tr(context, formState.userNameError!)
                : null,
            onChanged: (value) {
              ref.read(signUpProvider.notifier).onUsernameChanged(value);
            },
            onSubmitted: (_) {
              widget.emailFocusNode.requestFocus();
            },
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        /// Email Field
        StaggeredSlideFade(
          delay: 5 * AppMotion.staggerUnit,
          child: PrimaryTextField(
            controller: widget.emailController,
            focusNode: widget.emailFocusNode,
            hintText: tr(context, "auth_signup_email_hint"),
            topLabel: tr(context, "auth_signup_email_label"),
            prefixIcon: Icons.email,
            errorText: formState.emailError != null
                ? tr(context, formState.emailError!)
                : null,
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
            tr(context, "auth_signup_email_info"),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
