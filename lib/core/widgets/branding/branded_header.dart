import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:flowchat/core/constants/app_assets.dart';

class BrandedHeader extends StatefulWidget {
  const BrandedHeader({super.key});

  @override
  State<BrandedHeader> createState() => _BrandedHeaderState();
}

class _BrandedHeaderState extends State<BrandedHeader>
    with TickerProviderStateMixin {

  late final AnimationController _textController;
  late final AnimationController _iconController;

  late final Animation<Offset> _slide;
  late final Animation<double> _textFade;
  late final Animation<double> _iconFade;

  final String text = "Flow Chat";

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      vsync: this,
      duration: AppMotion.slow,
    );

    _textController = AnimationController(
      vsync: this,
      duration: AppMotion.verySlow,
    );

    _slide = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: AppMotion.enter,
    ));

    _textFade = Tween<double>(begin: 0, end: 1)
        .animate(_textController);

    _iconFade = Tween<double>(begin: 1, end: 0)
        .animate(_iconController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loop();
    });
  }

  Future<void> _loop() async {
    while (mounted) {

      _iconController.reverse();
      await Future.delayed(AppMotion.medium);

      await _textController.forward();
      await Future.delayed(const Duration(seconds: 3));

      await _textController.reverse();
      await _iconController.forward();

      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// ICON
        FadeTransition(
          opacity: _iconFade,
          child: Image.asset(
            AppAssets.appIconTransparent,
            height: 40,
          ),
        ),

        const SizedBox(width: 8),

        /// TEXT
        ClipRect(
          child: FadeTransition(
            opacity: _textFade,
            child: SlideTransition(
              position: _slide,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}