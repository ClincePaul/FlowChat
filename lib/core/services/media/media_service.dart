import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flowchat/core/models/media_pick_option.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _picker;

  MediaService(this._picker);

  Future<File?> pickFromCamera() async {
    try {
      if (kIsWeb ||
          Platform.isWindows ||
          Platform.isLinux ||
          Platform.isMacOS) {
        return null; // or throw custom error
      }
      final file = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      return file != null ? File(file.path) : null;
    } catch (e) {
      return null;
    }
  }

  Future<File?> pickFromGallery() async {
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    return file != null ? File(file.path) : null;
  }

  Future<File?> pickFromFileSystem({required MediaPickType type}) async {
    final config = mediaPickOptions[type];

    if (config == null) return null;

    final result = await FilePicker.pickFiles(
      allowMultiple: false,
      type: config.type,
      allowedExtensions: config.allowedExtensions,
    );

    if (result == null || result.files.isEmpty) return null;

    final path = result.files.single.path;
    if (path == null) return null;

    return File(path);
  }
}
