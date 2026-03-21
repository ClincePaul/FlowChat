import 'package:flowchat/features/auth/presentation/viewmodel/sign_up_step_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpStepWidget extends ConsumerWidget {
  const OtpStepWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Enter OTP", style: TextStyle(fontSize: 22)),

          const SizedBox(height: 20),

          TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Verification Code"),
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              ref.read(signUpStepProvider.notifier).goToProfile();
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
