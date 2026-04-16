import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color? color;
  final EdgeInsets? padding;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 24,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(2),
        child: Icon(
          icon,
          size: size,
          color: color ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}