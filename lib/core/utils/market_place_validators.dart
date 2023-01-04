class MarketPlaceValidators {
  MarketPlaceValidators._();
  static final MarketPlaceValidators _instance = MarketPlaceValidators._();
  factory MarketPlaceValidators() => _instance;

  bool isEmailValid(String em) {
    const Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern as String);
    return regex.hasMatch(em);
  }

  bool isUrlValid(String value) {
    return Uri.parse(value).isAbsolute;
  }
}
