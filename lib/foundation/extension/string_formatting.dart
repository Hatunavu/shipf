extension StringFormatting on String {
  String formatPhoneNumber() {
    if (contains('+84')) return replaceAll('+84', '0');
    return this;
  }

  String encodePhoneNumber() {
    return replaceAllMapped(
        RegExp(r'(\d{3})(\d{5})(\d+)'), (Match m) => "${m[1]}xxxxx${m[3]}");
  }
}
