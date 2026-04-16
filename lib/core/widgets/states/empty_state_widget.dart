import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final String mainText;
  final String subText;
  final double imageHeight;
  final String lottieAsset;

  const EmptyStateWidget({
    super.key,
    required this.mainText,
    required this.subText,
    required this.lottieAsset,
    this.imageHeight = 120,
  });

  @override
  Widget build(BuildContext context) {
    

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 🔥 Lottie Animation
          SizedBox(
            height: imageHeight,
            child: Lottie.asset(
              lottieAsset,
              repeat: false,
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          /// 🔹 Main Text
          Text(
            mainText,
            style:Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.grey.shade600)
          ),

          const SizedBox(height: AppSpacing.xs),

          /// 🔹 Sub Text
          Text(
            subText,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600 , color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}