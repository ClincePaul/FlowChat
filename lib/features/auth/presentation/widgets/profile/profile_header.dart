import 'package:flowchat/core/models/media_result.dart';
import 'package:flowchat/core/utils/media/media_flow.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/animations/staggered_slide_up.dart';
import 'package:flowchat/core/widgets/branding/glass_shimmer_header.dart';
import 'package:flowchat/features/auth/presentation/providers/profile_provider.dart';
import 'package:flowchat/core/utils/media/media_result_handler.dart';
import 'package:flowchat/features/auth/presentation/widgets/profile/profile_avatar.dart';
import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final profileState = ref.watch(profileViewModelProvider);
    final imageFile = profileState.profileImage;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GlassShimmerHeader(
          mainText: tr(context, "app_name"),
          subText: tr(context, "profile_tagline"),
        ),

        Positioned(
          bottom: -40,
          right: 10,
          child: StaggeredSlideFade(
            delay: 1 * AppMotion.staggerUnit,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withValues(alpha: 0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),

              /// 🔥 Clean avatar widget
              child: InkWell(
                onTap: () {
                  final notifier = ref.read(profileViewModelProvider.notifier);

                  MediaFlow.open(
                    context: context,
                    ref: ref,
                    currentFile: profileState.profileImage,

                    onViewed: (file) {
                      
                    },

                    onRemove: () {
                      notifier.setProfileImage(null);
                    },

                    onPicked: (file) async {
                      final result = await notifier.handlePickedFile(file);

                      if (!context.mounted) return;
                      handleMediaResult(
                        context: context,
                        onSuccess: (file) {
                          notifier.setProfileImage(file);
                        },
                        result: result,
                      );
                    },

                    /// ✏️ Edited
                    onEdited: (file) async {
                      final result = await notifier.handlePickedFile(file);

                      if (!context.mounted) return;
                      handleMediaResult(
                        context: context,
                        onSuccess: (file) {
                          notifier.setProfileImage(file);
                        },
                        result: result,
                      );
                    },

                    onPickedError: () {
                      const result = MediaResult(
                        status: MediaStatus.error,
                        errorKey: "image_not_selected",
                      );

                      handleMediaResult(
                        context: context,
                        onSuccess: (file) {},
                        result: result,
                      );
                    },
                  );
                },
                child: ProfileAvatar(imageFile: imageFile, isDark: isDark),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
