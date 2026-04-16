import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flowchat/core/utils/tr.dart';

class WaveTextAnimation extends ConsumerStatefulWidget {
  const WaveTextAnimation({super.key});

  @override
  ConsumerState<WaveTextAnimation> createState() => _WaveTextAnimationState();
}

class _WaveTextAnimationState extends ConsumerState<WaveTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// 🔧 Tunable values
  final double amplitude = 6;
  final double frequency = 2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = tr(context, 'app_name').split('');

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(characters.length, (index) {
            final phaseShift = index * 0.5;
            final y = sin((t * 2 * pi * frequency) + phaseShift) * amplitude;

            return Transform.translate(
              offset: Offset(0, y),
              child: Text(
                characters[index],
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          }),
        );
      },
    );
  }
}
