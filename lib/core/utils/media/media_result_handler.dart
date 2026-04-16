import 'dart:io';
import 'package:flowchat/core/models/media_result.dart';
import 'package:flowchat/core/utils/tr.dart';
import 'package:flowchat/core/widgets/app_status_banner/app_status_banner.dart';
import 'package:flutter/material.dart';

void handleMediaResult({
  required BuildContext context,
  required MediaResult result,
  required Function(File file) onSuccess,
}) {
  switch (result.status) {
    case MediaStatus.success:
      onSuccess(result.file!);
      break;

    case MediaStatus.tooLarge:
    case MediaStatus.error:
      if (result.errorKey != null) {
        AppStatusBanner.show(
          context: context,
          message: tr(context, result.errorKey!),
          icon: Icons.error_outline,
        );
      }
      break;
  }
}
