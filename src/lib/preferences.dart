class Preferences {
  String appLanguage = "en_US";

  void setLanguage(String language) {
    appLanguage = language;
  }

  String getAppLanguage() {
    return appLanguage;
  }
}

Preferences appPreferences = Preferences();