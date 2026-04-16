class AppLanguage {
  final String name;
  final String nativeName;
  final String code;

  const AppLanguage({
    required this.name,
    required this.nativeName,
    required this.code,
  });
}

const supportedLanguages = [
  AppLanguage(name: 'English', nativeName: 'English', code: 'en'),
  AppLanguage(name: 'Malayalam', nativeName: 'മലയാളം', code: 'ml'),
  AppLanguage(name: 'Hindi', nativeName: 'हिन्दी', code: 'hi'),
  AppLanguage(name: 'Tamil', nativeName: 'தமிழ்', code: 'ta'),
];