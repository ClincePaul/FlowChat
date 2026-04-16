import 'package:flutter/material.dart';

class MediaOptionModel {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;

  MediaOptionModel({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onTap,
  });
}