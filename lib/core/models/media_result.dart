import 'dart:io';

enum MediaStatus {
  success,
  tooLarge,
  error,
}

class MediaResult {
  final MediaStatus status;
  final File? file;
  final String? errorKey;

  const MediaResult({
    required this.status,
    this.file,
    this.errorKey,
  });
}