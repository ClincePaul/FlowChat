import 'package:flowchat/core/services/media/media_compression_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mediaCompressionServiceProvider =
    Provider<MediaCompressionService>((ref) {
  return MediaCompressionService();
});