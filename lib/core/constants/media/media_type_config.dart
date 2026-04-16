import 'package:flowchat/theme/base/app_colors.dart';
import 'package:flutter/material.dart';
import 'media_type.dart';

class MediaTypeConfig {
  final IconData icon;
  final String label;
  final Color iconColor;
  final bool isEnabled;

  const MediaTypeConfig({
    required this.icon,
    required this.label,
    required this.iconColor,
    this.isEnabled = true,
  });
}

/// 🔥 Central config map
const Map<MediaType, MediaTypeConfig> mediaTypeConfig = {
  MediaType.camera: MediaTypeConfig(
    icon: Icons.camera_alt,
    label: "Camera",
    iconColor: AppColors.camera,
  ),
  MediaType.gallery: MediaTypeConfig(
    icon: Icons.photo,
    label: "Gallery",
    iconColor: AppColors.gallery,
  ),
  MediaType.file: MediaTypeConfig(
    icon: Icons.folder,
    label: "Files",
    iconColor: AppColors.file,
  ),
  MediaType.document: MediaTypeConfig(
    icon: Icons.insert_drive_file,
    label: "Document",
    iconColor: AppColors.document,
  ),
  MediaType.audio: MediaTypeConfig(
    icon: Icons.audiotrack,
    label: "Audio",
    iconColor: AppColors.audio,
  ),
  MediaType.video: MediaTypeConfig(
    icon: Icons.videocam,
    label: "Video",
    iconColor: AppColors.video,
  ),
  MediaType.poll: MediaTypeConfig(
    icon: Icons.poll,
    label: "Poll",
    iconColor: AppColors.poll,
  ),
  MediaType.event: MediaTypeConfig(
    icon: Icons.event,
    label: "Event",
    iconColor: AppColors.event,
  ),
  MediaType.location: MediaTypeConfig(
    icon: Icons.location_on,
    label: "Location",
    iconColor: AppColors.location,
  ),
};