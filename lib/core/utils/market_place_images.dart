class AllImages {
  // Creating singleton to access this class properties
  AllImages._();
  static final AllImages _instance = AllImages._();
  factory AllImages() => _instance;

  String appLogo = "assets/images/app_logo.png";
}
