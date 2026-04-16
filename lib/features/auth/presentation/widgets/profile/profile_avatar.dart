import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flowchat/theme/base/app_icon_sizes.dart';

class ProfileAvatar extends StatelessWidget {
  final File? imageFile;
  final bool isDark;

  const ProfileAvatar({
    super.key,
    required this.imageFile,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48,
      backgroundColor: isDark
          ? const Color.fromARGB(255, 46, 46, 46)
          : Colors.grey.shade100,
      backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
      child: imageFile == null
          ?   Icon(
              Icons.camera_alt,
              size: AppIconSize.iconHuge,
              color: isDark ? Colors.white70 : Colors.grey.shade700,
            )
          : null,
    );
  }
}
