import 'package:country_picker/country_picker.dart';
import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/core/constants/image_urls.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/app_bottom_sheet.dart';
import 'package:flowchat/core/widgets/bottom_sheets/base/bottom_sheet_drag_handle.dart';
import 'package:flowchat/core/widgets/states/empty_state_widget.dart';
import 'package:flowchat/core/widgets/text_fields/primary_text_field.dart';
import 'package:flowchat/features/auth/presentation/providers/profile_provider.dart';
import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_radius.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CountryPickerSheet extends ConsumerStatefulWidget {
  const CountryPickerSheet({super.key});

  @override
  ConsumerState<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends ConsumerState<CountryPickerSheet> {
  @override
  void initState() {
    super.initState();
    final list = CountryService().getAll();

    Future.microtask(() {
      ref.read(profileViewModelProvider.notifier).setCountries(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileViewModelProvider);
    return AppBottomSheet(
      child: Column(
        children: [
          const BottomSheetDragHandle(),
          const SizedBox(height: AppSpacing.xs),
          PrimaryTextField(
            hintText: tr(context, 'search_country_hint'),
            //onChanged: _search,
            onChanged: (value) {
              ref.read(profileViewModelProvider.notifier).searchCountry(value);
            },
            prefixIcon: Icons.search,
            borderRadius: AppRadius.xl,
            suffixIcon: MdiIcons.earth,
          ),

          const SizedBox(height: AppSpacing.md),

          /// 🔹 List
          Expanded(
            child: state.countries.isEmpty
                ? EmptyStateWidget(
                    mainText: tr(context, "empty_no_data_title"),
                    subText: tr(context, "empty_no_data_sub"),
                    lottieAsset: AppAssets.noData,
                  )
                : ListView.builder(
                    itemCount: state.countries.length,
                    itemBuilder: (context, index) {
                      final country = state.countries[index];

                      return ListTile(
                        contentPadding: AppPadding.horizontalsm,
                        leading: CircleAvatar(
                          radius: AppRadius.md,

                          child: ClipOval(
                            child: Image.network(
                              ImageUrls.flag(country.countryCode),
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.flag,
                                  size: 16,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                        ),
                        title: Text(
                          country.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Text(
                          "+${country.phoneCode}",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          ref
                              .read(profileViewModelProvider.notifier)
                              .updateCountryCode("+${country.phoneCode}");

                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}





// import 'package:country_picker/country_picker.dart';
// import 'package:flowchat/core/constants/app_assets.dart';
// import 'package:flowchat/core/constants/image_urls.dart';
// import 'package:flowchat/core/utils/tr.dart';
// import 'package:flowchat/core/widgets/bottom_sheets/base/app_bottom_sheet.dart';
// import 'package:flowchat/core/widgets/states/empty_state_widget.dart';
// import 'package:flowchat/core/widgets/text_fields/primary_text_field.dart';
// import 'package:flowchat/features/auth/presentation/viewmodel/profile/profile_viewmodel.dart';
// import 'package:flowchat/theme/base/app_padding.dart';
// import 'package:flowchat/theme/base/app_radius.dart';
// import 'package:flowchat/theme/base/app_spacing.dart';
// import 'package:flowchat/theme/base/app_textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import 'wave_text_animation.dart'; // 👈 your animation file

// class CountryPickerSheet extends ConsumerStatefulWidget {
//   const CountryPickerSheet({super.key});

//   @override
//   ConsumerState<CountryPickerSheet> createState() =>
//       _CountryPickerSheetState();
// }

// class _CountryPickerSheetState
//     extends ConsumerState<CountryPickerSheet> {
//   final ScrollController _scrollController = ScrollController();

//   bool showBottomAnimation = false;

//   @override
//   void initState() {
//     super.initState();

//     final list = CountryService().getAll();

//     Future.microtask(() {
//       ref.read(profileViewModelProvider.notifier).setCountries(list);
//     });

//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     final isAtBottom = _scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent - 20;

//     if (isAtBottom && !showBottomAnimation) {
//       setState(() => showBottomAnimation = true);
//     } else if (!isAtBottom && showBottomAnimation) {
//       setState(() => showBottomAnimation = false);
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(profileViewModelProvider);

//     return AppBottomSheet(
//       child: Column(
//         children: [
//           /// 🔹 Drag Handle
//           Container(
//             width: 40,
//             height: 4,
//             margin: const EdgeInsets.only(bottom: AppSpacing.md),
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(AppRadius.sm),
//             ),
//           ),

//           const SizedBox(height: AppSpacing.xs),

//           /// 🔹 Search Field
//           PrimaryTextField(
//             hintText: tr(ref, 'search_country_hint'),
//             onChanged: (value) {
//               ref
//                   .read(profileViewModelProvider.notifier)
//                   .searchCountry(value);
//             },
//             prefixIcon: Icons.search,
//             borderRadius: AppRadius.xl,
//             suffixIcon: MdiIcons.earth,
//           ),

//           const SizedBox(height: AppSpacing.md),

//           /// 🔹 List + Bottom Animation
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: state.countries.isEmpty
//                       ? EmptyStateWidget(
//                           mainText: tr(ref, "empty_no_data_title"),
//                           subText: tr(ref, "empty_no_data_sub"),
//                           lottieAsset: AppAssets.noData,
//                         )
//                       : ListView.builder(
//                           controller: _scrollController,
//                           itemCount: state.countries.length,
//                           itemBuilder: (context, index) {
//                             final country = state.countries[index];

//                             return ListTile(
//                               contentPadding: AppPadding.horizontalsm,
//                               leading: CircleAvatar(
//                                 radius: AppRadius.md,
//                                 child: ClipOval(
//                                   child: Image.network(
//                                     ImageUrls.flag(country.countryCode),
//                                     width: 35,
//                                     height: 35,
//                                     fit: BoxFit.cover,
//                                     errorBuilder:
//                                         (context, error, stackTrace) {
//                                       return const Icon(
//                                         Icons.flag,
//                                         size: 16,
//                                         color: Colors.grey,
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               title: Text(
//                                 country.name,
//                                 style: Theme.of(context).textTheme.bodyMedium,
//                               ),
//                               trailing: Text(
//                                 "+${country.phoneCode}",
//                                 style:
//                                     Theme.of(context).textTheme.bodySmall.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               onTap: () {
//                                 ref
//                                     .read(profileViewModelProvider.notifier)
//                                     .updateCountryCode(
//                                         "+${country.phoneCode}");
//                                 Navigator.pop(context);
//                               },
//                             );
//                           },
//                         ),
//                 ),

//                 /// 🔥 Bottom Animation
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 300),
//                   child: showBottomAnimation
//                       ? const Padding(
//                           padding: EdgeInsets.only(top: 10),
//                           child: WaveTextAnimation(),
//                         )
//                       : const SizedBox.shrink(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }