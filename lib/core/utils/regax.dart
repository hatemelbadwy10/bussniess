class Regex {
  static final RegExp lowercase = RegExp(r'[a-z]');
  static final RegExp uppercase = RegExp(r'[A-Z]');
  static final RegExp numeral = RegExp(r'[0-9]');
  static final RegExp punctuation = RegExp(r'[!@#$%^&*(),.?:{}|<>=]');
  static final RegExp moreThan7Char = RegExp(r'.{7,}');
  static final RegExp email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp extractKeyValue = RegExp(r"<'([^']*)'>");
}
