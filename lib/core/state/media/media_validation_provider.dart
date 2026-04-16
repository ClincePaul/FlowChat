import 'package:flowchat/core/services/media/media_validation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mediaValidationServiceProvider =
    Provider<MediaValidationService>((ref) {
  return MediaValidationService();
});