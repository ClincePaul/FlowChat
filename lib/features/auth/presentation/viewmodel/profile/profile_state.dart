import 'dart:io';
import 'package:country_picker/country_picker.dart';

class ProfileState {
  final File? profileImage;
  final String name;
  final String phone;
  final String countryCode;
  final String about;
  final List<Country> countries;
  final String? imageErrorKey;
  final int errorTrigger; 

  const ProfileState({
    this.profileImage,
    this.name = '',
    this.phone = '',
    this.countryCode = '',
    this.about = '',
    this.countries = const [],
    this.imageErrorKey,
    this.errorTrigger = 0,
  });

  ProfileState copyWith({
    File? profileImage,
    String? name,
    String? phone,
    String? countryCode,
    String? about,
    List<Country>? countries,
    String? imageErrorKey,
    int? errorTrigger,
  }) {
    return ProfileState(
      profileImage: profileImage,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      about: about ?? this.about,
      countries: countries ?? this.countries,
      imageErrorKey: imageErrorKey ?? this.imageErrorKey,
      errorTrigger: errorTrigger ?? this.errorTrigger,
    );
  }
}
