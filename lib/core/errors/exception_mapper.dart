import 'package:flowchat/core/errors/app_error_types.dart';
import 'package:flowchat/core/errors/exceptions/network_exception.dart';
import 'package:flowchat/core/errors/exceptions/url_launch_exception.dart';
import 'app_error.dart';
import 'package:flutter/services.dart';

class ExceptionMapper {
  static AppError map(Object error) {
    if (error is NetworkException) {
      return const AppError(
        type: AppErrorType.network,
        messageKey: "no_internet",
      );
    }

    if (error is UrlLaunchException) {
      return AppError(type: AppErrorType.urlLaunch, messageKey: error.message);
    }

    if (error is FormatException) {
      return const AppError(
        type: AppErrorType.invalidUrl,
        messageKey: "url_invalid",
      );
    }

    if (error is ArgumentError) {
      return const AppError(
        type: AppErrorType.invalidArgument,
        messageKey: "invalid_argument",
      );
    }

    if (error is PlatformException) {
      return const AppError(
        type: AppErrorType.invalidUrl,
        messageKey: "platform_error",
      );
    }

    return const AppError(
      type: AppErrorType.unknown,
      messageKey: "unknown_error",
    );
  }
}
