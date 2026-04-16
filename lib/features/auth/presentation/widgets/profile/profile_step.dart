import 'package:flowchat/features/auth/presentation/providers/profile_provider.dart';
import 'package:flowchat/features/auth/presentation/widgets/profile/profile_actions.dart';
import 'package:flowchat/features/auth/presentation/widgets/profile/profile_form.dart';
import 'package:flowchat/features/auth/presentation/widgets/profile/profile_header.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileStepWidget extends ConsumerStatefulWidget {
  const ProfileStepWidget({super.key});

  @override
  ConsumerState<ProfileStepWidget> createState() => _ProfileStepWidgetState();
}

class _ProfileStepWidgetState extends ConsumerState<ProfileStepWidget> {
  final TextEditingController _countryCodeController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode aboutFocuNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    aboutFocuNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileViewModelProvider);
    if (_countryCodeController.text != profile.countryCode) {
      _countryCodeController.text = profile.countryCode;
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const ProfileHeader(),
         const SizedBox(height: AppSpacing.lg),
         ProfileForm(
            aboutFocuNode: aboutFocuNode,
            countryCodeController: _countryCodeController,
            nameFocusNode: nameFocusNode,
          ),
      
         const ProfileActions()
        ],
      ),
    );
  }
}

// class AnimatedChatPreview extends StatefulWidget {
//   const AnimatedChatPreview({super.key});

//   @override
//   State<AnimatedChatPreview> createState() => _AnimatedChatPreviewState();
// }

// class _AnimatedChatPreviewState extends State<AnimatedChatPreview>
//     with TickerProviderStateMixin {
//   final List<String> messages = [
//     "Hey 👋",
//     "Welcome to FlowChat",
//     "Start chatting now!",
//   ];

//   final List<bool> visible = [];

//   @override
//   void initState() {
//     super.initState();
//     visible.addAll(List.generate(messages.length, (_) => false));
//     _startLoop();
//   }

//   Future<void> _startLoop() async {
//     while (mounted) {
//       // 👉 Show messages one by one
//       for (int i = 0; i < messages.length; i++) {
//         await Future.delayed(const Duration(milliseconds: 500));
//         if (!mounted) return;
//         setState(() => visible[i] = true);
//       }

//       // 👉 Wait before reverse
//       await Future.delayed(const Duration(seconds: 2));

//       // 👉 Reverse (remove from top first for natural chat feel)
//       for (int i = 0; i < messages.length; i++) {
//         await Future.delayed(const Duration(milliseconds: 300));
//         if (!mounted) return;
//         setState(() => visible[i] = false);
//       }

//       // 👉 Small gap before restart
//       await Future.delayed(const Duration(milliseconds: 500));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: List.generate(messages.length, (index) {
//         return AnimatedSlide(
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeOutCubic,
//           offset: visible[index] ? Offset.zero : const Offset(0, 0.5),
//           child: AnimatedOpacity(
//             duration: const Duration(milliseconds: 300),
//             opacity: visible[index] ? 1 : 0,
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               margin: EdgeInsets.only(
//                 bottom: visible[index] ? 6 : 0,
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 6,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.08),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 messages[index],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
