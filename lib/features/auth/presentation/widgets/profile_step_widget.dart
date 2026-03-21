import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileStepWidget extends ConsumerWidget {
  const ProfileStepWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Complete Profile", style: TextStyle(fontSize: 22)),

          const SizedBox(height: 20),

          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),

          const SizedBox(height: 20),

          Row(
            children: [
              const SizedBox(
                width: 80,
                child: TextField(decoration: InputDecoration(labelText: "+91")),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              //ref.read(signInStepProvider.notifier).finish();
            },
            child: const Text("Finish"),
          ),
        ],
      ),
    );
  }
}
