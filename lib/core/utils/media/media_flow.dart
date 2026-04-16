import 'dart:io';
import 'package:flowchat/core/constants/media/media_action.dart';
import 'package:flowchat/core/constants/media/media_action_config.dart';
import 'package:flowchat/core/constants/media/media_type.dart';
import 'package:flowchat/core/constants/media/media_type_config.dart';
import 'package:flowchat/core/models/media_option.dart';
import 'package:flowchat/core/models/media_pick_option.dart';
import 'package:flowchat/core/state/media/media_service_provider.dart';
import 'package:flowchat/core/utils/bottom_sheet_utils.dart';
import 'package:flowchat/core/widgets/bottom_sheets/media/media_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaFlow {
  static void open({
    required BuildContext context,
    required WidgetRef ref,
    required File? currentFile,
    required VoidCallback onRemove,
    required Function(File) onPicked,
    required Function(File) onEdited,
    required VoidCallback onPickedError,
    required Function(File) onViewed,
  }) {
    final hasImage = currentFile != null;

    if (hasImage) {
      _showActionSheet(
        context,
        ref,
        currentFile,
        onRemove,
        onPicked,
        onEdited,
        onPickedError,
        onViewed
      );
    } else {
      _showPickerSheet(context, ref, onPicked, onPickedError);
    }
  }

  /// 🔥 ACTION SHEET (USES CONFIG)
  static void _showActionSheet(
    BuildContext context,
    WidgetRef ref,
    File currentFile,
    VoidCallback onRemove,
    Function(File) onPicked,
    Function(File) onEdited,
    VoidCallback onPickedError,
    Function(File) onViewed,
  ) {
    final mediaService = ref.read(mediaServiceProvider);

    final options = [
      for (final action in MediaAction.values)
        MediaOptionModel(
          icon: mediaActionConfig[action]!.icon,
          label: mediaActionConfig[action]!.label,
          iconColor: mediaActionConfig[action]!.iconColor,
          onTap: () async {
            switch (action) {
              case MediaAction.view:
                onViewed(currentFile);
                break;

              case MediaAction.edit:
                onEdited(currentFile);
                break;

              case MediaAction.change:
                final file = await mediaService.pickFromGallery();
                if (file == null) {
                  onPickedError();
                  return;
                }
                onPicked(file);
                break;

              case MediaAction.remove:
                onRemove();
                break;
            }
          },
        ),
    ];

    showAppBottomSheet(
      context: context,
      child: FractionallySizedBox(
        heightFactor: 0.40,
        child: MediaPickerSheet(options: options),
      ),
    );
  }

  /// 🔥 PICKER SHEET (USES mediaTypeConfig)
  static void _showPickerSheet(
    BuildContext context,
    WidgetRef ref,
    Function(File) onPicked,
    VoidCallback onPickedError,
  ) {
    final mediaService = ref.read(mediaServiceProvider);

    final allowedTypes = [
      MediaType.camera,
      MediaType.gallery,
      MediaType.file,
    ];

    final options = [
      for (final type in allowedTypes)
        if (mediaTypeConfig[type] != null &&
            mediaTypeConfig[type]!.isEnabled)
          MediaOptionModel(
            icon: mediaTypeConfig[type]!.icon,
            label: mediaTypeConfig[type]!.label,
            iconColor: mediaTypeConfig[type]!.iconColor,
            onTap: () async {
              File? file;

              switch (type) {
                case MediaType.camera:
                  file = await mediaService.pickFromCamera();
                  break;

                case MediaType.gallery:
                  file = await mediaService.pickFromGallery();
                  break;

                case MediaType.file:
                  file = await mediaService.pickFromFileSystem(
                    type: MediaPickType.image,
                  );
                  break;

                default:
                  return;
              }

              if (file == null) {
                onPickedError();
                return;
              }

              onPicked(file);
            },
          ),
    ];

    showAppBottomSheet(
      context: context,
      child: FractionallySizedBox(
        heightFactor: 0.40,
        child: MediaPickerSheet(options: options),
      ),
    );
  }
}