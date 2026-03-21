import 'package:flowchat/core/errors/app_error_types.dart';
import 'package:flowchat/core/widgets/app_status_banner/app_status_banner.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../errors/app_error.dart';

class ErrorPresenter {
  static void show(BuildContext context, String message, AppError error) {
    IconData icon;

    switch (error.type) {
      case AppErrorType.network:
        icon = Icons.wifi_off;
        break;

      case AppErrorType.urlLaunch:
        icon = Icons.portable_wifi_off;
        break;

      case AppErrorType.invalidUrl:
        icon = MdiIcons.linkVariantOff;
        break;

      case AppErrorType.invalidArgument:
        icon = MdiIcons.databaseOff;
        break;

      case AppErrorType.platformException:
        icon = MdiIcons.cellphoneLinkOff;
        break;

      case AppErrorType.unknown:
        icon = MdiIcons.cloudQuestion;
        break;
    }

    AppStatusBanner.show(
      context: context,
      message: message,
      icon: icon,
    );
  }
}