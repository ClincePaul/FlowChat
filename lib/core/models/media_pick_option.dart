import 'package:file_picker/file_picker.dart';

enum MediaPickType {
  image,
  document,
  video,
  audio,
  any,
}

class MediaPickOption {
  final FileType type;
  final List<String>? allowedExtensions;

  const MediaPickOption({
    required this.type,
    this.allowedExtensions,
  });
}

/// 🔥 Central mapping (NO SWITCH)
const Map<MediaPickType, MediaPickOption> mediaPickOptions = {
  MediaPickType.image: MediaPickOption(
    type: FileType.image,
  ),
  MediaPickType.video: MediaPickOption(
    type: FileType.video,
  ),
  MediaPickType.audio: MediaPickOption(
    type: FileType.audio,
  ),
  MediaPickType.document: MediaPickOption(
    type: FileType.custom,
    allowedExtensions: [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'ppt',
      'pptx',
    ],
  ),
  MediaPickType.any: MediaPickOption(
    type: FileType.any,
  ),
};