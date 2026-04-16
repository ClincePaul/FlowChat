import 'package:flowchat/core/utils/bottom_sheet_utils.dart';
import 'package:flowchat/core/utils/input_formatters.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/bottom_sheets/country/country_picker_sheet.dart';
import 'package:flowchat/core/widgets/text_fields/primary_text_field.dart';
import 'package:flowchat/features/auth/presentation/providers/profile_provider.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileForm extends ConsumerWidget {
  final FocusNode nameFocusNode;
  final FocusNode aboutFocuNode;
  final TextEditingController countryCodeController;

  const ProfileForm({
    super.key,
    required this.nameFocusNode,
    required this.aboutFocuNode,
    required this.countryCodeController,
  });

  void _openCountryPicker(BuildContext context) {
    showAppBottomSheet(
      context: context,
      child: const FractionallySizedBox(
        heightFactor: 0.75,
        child: CountryPickerSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaggeredSlideFade(
          delay: 2 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.md,
            child: Text(
              tr(context, "profile_title"),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        StaggeredSlideFade(
          delay: 3 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.horizontalmd,
            child: PrimaryTextField(
              focusNode: nameFocusNode,
              hintText: tr(context, "profile_name_hint"),
              prefixIcon: MdiIcons.accountTie,
              onChanged: (value) {
                ref.read(profileViewModelProvider.notifier).updateName(value);
              },
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        StaggeredSlideFade(
          delay: 4 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.md,
            child: Row(
              children: [
                SizedBox(
                  width: 58,
                  child: PrimaryTextField(
                    readOnly: true,
                    onTap: () {
                      _openCountryPicker(context);
                    },
                    controller: countryCodeController,
                    hintText: tr(context, "profile_country_code"),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: PrimaryTextField(
                    hintText: tr(context, "profile_phone_hint"),
                    prefixIcon: MdiIcons.cellphone,

                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      MaxLengthFormatter(17),
                    ],
                    onChanged: (value) {
                      ref
                          .read(profileViewModelProvider.notifier)
                          .updatePhone(value);
                    },
                    onSubmitted: (_) {
                      aboutFocuNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        StaggeredSlideFade(
          delay: 5 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.horizontalmd,
            child: Text(
              tr(context, "profile_about_label"),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        StaggeredSlideFade(
          delay: 6 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.horizontalmd,
            child: PrimaryTextField(
              hintText: tr(context, "profile_about_hint"),
              prefixIcon: MdiIcons.messageText,
              focusNode: aboutFocuNode,
              onChanged: (value) {
                ref.read(profileViewModelProvider.notifier).updateAbout(value);
              },
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
        StaggeredSlideFade(
          delay: 7 * AppMotion.staggerUnit,
          child: Padding(
            padding: AppPadding.horizontalmd,
            child: Text(
              tr(context, "profile_info_text"),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
