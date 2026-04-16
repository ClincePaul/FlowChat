import 'dart:io';

class MediaValidationResult {
  final bool isValid;
  final bool needsCompression;

  const MediaValidationResult({
    required this.isValid,
    required this.needsCompression,
  });
}

class MediaValidationService {
  static const int softLimit = 300 * 1024; // 300 KB
  static const int hardLimit = 3072 * 1024; // 3 MB

  MediaValidationResult validate({
  required File file,
  required int softLimit,
  required int hardLimit,
  }) {
    final size = file.lengthSync();

    if (size <= softLimit) {
      return const MediaValidationResult(
        isValid: true,
        needsCompression: false,
      );
    }

    if (size <= hardLimit) {
      return const MediaValidationResult(
        isValid: true,
        needsCompression: true,
      );
    }

    return const MediaValidationResult(
      isValid: false,
      needsCompression: true,
    );
  }
}