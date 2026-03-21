import 'package:flowchat/core/errors/app_error_types.dart';

class AppError {
  final AppErrorType type;
  final String messageKey;

  const AppError({
    required this.type,
    required this.messageKey,
  });
}