import 'package:flowchat/theme/animations/app_motion.dart';
import 'package:flutter/material.dart';
import 'package:flowchat/core/constants/app_assets.dart';
import 'package:flowchat/theme/base/app_textstyle.dart';

class BrandedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BrandedAppBar({super.key});

  @override
  State<BrandedAppBar> createState() => _BrandedAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _BrandedAppBarState extends State<BrandedAppBar>
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

    /// ✅ ICON CONTROLLER FIRST
    _iconController = AnimationController(
      vsync: this,
      duration: AppMotion.slow,
    );

    /// ✅ TEXT CONTROLLER
    _textController = AnimationController(
      vsync: this,
      duration:   AppMotion.verySlow,
    );

    /// TEXT ANIMATIONS
    _slide = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: AppMotion.enter,
    ));

    _textFade = Tween<double>(begin: 0, end: 1)
        .animate(_textController);

    /// ICON FADE (IMPORTANT)
    _iconFade = Tween<double>(begin: 1, end: 0)
        .animate(_iconController);

    /// start loop AFTER everything ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loop();
    });
  }

  Future<void> _loop() async {
    while (mounted) {

      /// 🔹 STEP 1: ensure icon visible
      _iconController.reverse();

      await Future.delayed(AppMotion.medium);

      /// 🔹 STEP 2: show text
      await _textController.forward();

      await Future.delayed(const Duration(seconds: 3));

      /// 🔹 STEP 3: hide text
      await _textController.reverse();

      /// 🔹 STEP 4: hide icon
      await _iconController.forward();

      /// 🔹 wait before next loop
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
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [

          /// ✅ ICON FADE (FIXED)
          FadeTransition(
            opacity: _iconFade,
            child: Image.asset(
              AppAssets.appIconTransparent,
              height: 40,
            ),
          ),

        

          /// ✅ TEXT
          ClipRect(
            child: FadeTransition(
              opacity: _textFade,
              child: SlideTransition(
                position: _slide,
                child: Text(
                  text,
                  style: AppTextStyles.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}