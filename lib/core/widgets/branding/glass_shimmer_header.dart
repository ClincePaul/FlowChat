import 'package:flowchat/theme/base/app_padding.dart';
import 'package:flowchat/theme/base/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassShimmerHeader extends StatefulWidget {
  final String mainText;
  final String subText;

  const GlassShimmerHeader({
    super.key,
    required this.mainText,
    required this.subText,
  });

  @override
  State<GlassShimmerHeader> createState() => _GlassShimmerHeaderState();
}

class _GlassShimmerHeaderState extends State<GlassShimmerHeader>
    with TickerProviderStateMixin {
  late final AnimationController _shimmerController;
  late final AnimationController _gradientController;

  static const List<Color> shimmerTextGradient = [
    Colors.white,
    Color.fromARGB(255, 189, 190, 192),
    Colors.white,
    Colors.white,
    Color.fromARGB(255, 189, 190, 192),
  ];

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _shimmerController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 4));
        if (mounted) {
          _shimmerController.forward(from: 0);
        }
      }
    });

    _shimmerController.forward();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          /// 🔹 Background gradient animation
          AnimatedBuilder(
            animation: _gradientController,
            builder: (context, child) {
              final value = _gradientController.value;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      Color.fromARGB(255, 54, 60, 91),
                      Color.fromARGB(255, 71, 93, 142),
                      Color.fromARGB(255, 37, 58, 92),
                    ],
                    begin: Alignment(1 + value * 0.3, -1),
                    end: Alignment(1, 1 - value * 0.3),
                  ),
                ),
              );
            },
          ),

          /// 🔹 Shimmer + Text (merged into ONE builder)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _shimmerController,
              builder: (context, child) {
                final progress = _shimmerController.value;

                return Stack(
                  children: [
                    /// 🔸 Moving shimmer light
                    Transform.translate(
                      offset: Offset(
                        screenWidth * (progress * 1.5 - 0.5),
                        0,
                      ),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.06),
                              Colors.white.withValues(alpha: 0.12),
                              Colors.white.withValues(alpha: 0.06),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),

                    /// 🔸 Text content
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: AppPadding.horizontallg,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment(-3 + progress * 4, 0),
                                  end: Alignment(2 + progress * 4, 0),
                                  colors: shimmerTextGradient,
                                  stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: Text(
                                widget.mainText,
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment(-3 + progress * 4, 0),
                                  end: Alignment(3 + progress * 4, 0),
                                  colors: shimmerTextGradient,
                                  stops: const [0.0, 0.4, 0.5, 0.6, 1.0],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: Text(
                                widget.subText,
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}