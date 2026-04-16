import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flowchat/core/constants/media/media_limits.dart';
import 'package:flowchat/core/models/media_result.dart';
import 'package:flowchat/core/services/media/media_compression_service.dart';
import 'package:flowchat/core/services/media/media_service.dart';
import 'package:flowchat/core/services/media/media_validation_service.dart';
import 'package:flowchat/core/state/media/media_compression_provider.dart';
import 'package:flowchat/core/state/media/media_service_provider.dart';
import 'package:flowchat/core/state/media/media_validation_provider.dart';
import 'package:flowchat/core/utils/search_utils.dart';
import 'package:flowchat/features/auth/presentation/viewmodel/profile/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileViewModel extends Notifier<ProfileState> {
  late final MediaService mediaService;
  late final MediaValidationService validationService;
  late final MediaCompressionService compressionService;

  late List<Country> allCountries;

  @override
  ProfileState build() {
    /// ✅ Inject dependency here
    mediaService = ref.read(mediaServiceProvider);
    validationService = ref.read(mediaValidationServiceProvider);
    compressionService = ref.read(mediaCompressionServiceProvider);
    return const ProfileState();
  }

  /// 🌍 Set country list
  void setCountries(List<Country> list) {
    allCountries = list;
    state = state.copyWith(countries: list);
  }

  /// 🔍 Search country
  void searchCountry(String value) {
    final result = SearchUtils.search(
      items: allCountries,
      query: value,
      name: (c) => c.name,
      code: (c) => c.phoneCode,
    );

    state = state.copyWith(countries: result);
  }

  /// 👤 Update Name
  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  /// 🌐 Update Country Code
  void updateCountryCode(String value) {
    state = state.copyWith(countryCode: value);
  }

  /// 📱 Update Phone
  void updatePhone(String value) {
    state = state.copyWith(phone: value);
  }

  /// 📝 Update About
  void updateAbout(String value) {
    state = state.copyWith(about: value);
  }

  void clear() {
    state = const ProfileState();
  }

Future<MediaResult> handlePickedFile(File file) async {
  try {
    final result = validationService.validate(
      file: file,
      softLimit: MediaLimits.profileSoftLimit,
      hardLimit: MediaLimits.profileHardLimit,
    );

    if (!result.isValid) {
      return const MediaResult(
        status: MediaStatus.tooLarge,
        errorKey: "image_too_large",
      );
    }

    File finalFile = file;

    if (result.needsCompression) {
      finalFile = await compressionService.compress(file);
    }

    return MediaResult(
      status: MediaStatus.success,
      file: finalFile,
    );
  } catch (e) {
    return const MediaResult(
      status: MediaStatus.error,
      errorKey: "image_pick_failed",
    );
  }
}

  void setProfileImage(File? file) {
    state = state.copyWith(profileImage: file);
  }

  void clearImageError() {
    state = state.copyWith(imageErrorKey: null);
  }
}
