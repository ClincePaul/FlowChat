import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'media_action.dart';

class MediaActionConfig {
  final IconData icon;
  final String label;
  final Color iconColor;

  const MediaActionConfig({
    required this.icon,
    required this.label,
    required this.iconColor,
  });
}

 Map<MediaAction, MediaActionConfig> mediaActionConfig = {
  MediaAction.view: const MediaActionConfig(
    icon: Icons.zoom_out_map,
    label: "View",
    iconColor: AppColors.view,
  ),
  MediaAction.edit: MediaActionConfig(
    icon: MdiIcons.imageEdit,
    label: "Edit",
    iconColor: AppColors.edit,
  ),
  MediaAction.change: MediaActionConfig(
    icon: MdiIcons.imagePlus,
    label: "Change",
    iconColor: AppColors.gallery,
  ),
  MediaAction.remove: MediaActionConfig(
    icon: MdiIcons.imageRemove,
    label: "Remove",
    iconColor: AppColors.remove,
  ),
};