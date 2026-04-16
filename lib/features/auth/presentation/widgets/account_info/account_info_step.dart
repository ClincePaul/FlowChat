import 'package:flowchat/core/utils/bottom_sheet_utils.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/bottom_sheets/language/language_picker_sheet.dart';
import 'package:flowchat/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flowchat/features/auth/presentation/widgets/account_info/account_info_actions.dart';
import 'package:flowchat/features/auth/presentation/widgets/account_info/account_info_form.dart';
import 'package:flowchat/features/auth/presentation/widgets/account_info/account_info_header.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class EmailStepWidget extends ConsumerStatefulWidget {
  const EmailStepWidget({super.key});

  @override
  ConsumerState<EmailStepWidget> createState() => _EmailStepWidgetState();
}

class _EmailStepWidgetState extends ConsumerState<EmailStepWidget> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formState = ref.read(signUpProvider);

      /// ✅ Restore values
      usernameController.text = formState.username;
      emailController.text = formState.email;
      usernameFocusNode.requestFocus();
    });
  }

  void _openLanguagePicker(BuildContext context) {
    showAppBottomSheet(
      context: context,
      child: const FractionallySizedBox(
        heightFactor: 0.75,
        child:LanguagePickerSheet(),
      ),
    );
  }
  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.md,
              left: AppSpacing.lg,
              right: AppSpacing.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AccountInfoHeader(),

                const SizedBox(height: AppSpacing.xl),

                /// Username Field
                AccountInfoForm(
                  emailController: emailController,
                  emailFocusNode: emailFocusNode,
                  usernameController: usernameController,
                  usernameFocusNode: usernameFocusNode,
                ),

                const SizedBox(height: AppSpacing.md),

                const AccountInfoActions(),

                const Spacer(), // 👈 pushes bottom content down
                /// ✅ Language Switch (BOTTOM RIGHT)
                 StaggeredSlideFade(
                  delay: 10 * AppMotion.staggerUnit,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: InkWell(
                        onTap: (){
                          _openLanguagePicker(context);
                        },
                        child: Text(
                          tr(context, "auth_signup_language_text"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
