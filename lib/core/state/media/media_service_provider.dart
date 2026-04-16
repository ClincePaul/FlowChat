import 'package:flowchat/core/services/media/media_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final mediaServiceProvider = Provider<MediaService>((ref) {
  return MediaService(ImagePicker());
});
