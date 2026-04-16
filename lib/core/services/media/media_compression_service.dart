import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class MediaCompressionService {
  static const int targetSize = 200 * 1024; // 200 KB
  static const int maxWidth = 1080;
  static const int maxHeight = 1080;

  Future<File> compress(File file) async {
    final dir = await getTemporaryDirectory();

    final targetPath = p.join(
      dir.path,
      "${DateTime.now().millisecondsSinceEpoch}.jpg",
    );

    int quality = 90;
    File? compressedFile;

    // 🔁 Loop until file size is under target OR quality too low
    do {
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
        minWidth: maxWidth,
        minHeight: maxHeight,
        format: CompressFormat.jpeg,
      );

      if (result == null) {
        return file; // fallback (safe return)
      }

      compressedFile = File(result.path);

      final size = await compressedFile.length();

      if (size <= targetSize) {
        return compressedFile;
      }

      quality -= 10; // reduce quality step-by-step
    } while (quality > 30);

    // ⚠️ If still large, return best effort
    return compressedFile;
  }
}