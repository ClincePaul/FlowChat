class ImageUrls {
  ImageUrls._();

  static String flag(String code) =>
      "https://flagcdn.com/w40/${code.toLowerCase()}.png";
}