class Preferences {
  String appLanguage = "en_US";
  String macAddress = "";
  String firstName = "";
  String lastName = "";
  String birthDate = "";
  String birthCity = "";
  String residenceCity = "";
  String email = "";
  String password = "";
  String softSkills = "";
  String jobExpectation = "";
  String currentJob = "";

  void setLanguage(String language) {
    appLanguage = language;
  }

  void registerDataOne(String fN, String lN, String bD, String bC) {
    firstName = fN;
    lastName = lN;
    birthDate = bD;
    birthCity = bC;
  }

  void registerDataTwo(String rC, String e, String p, String sS, String jE, String cJ) {
    residenceCity = rC;
    email = e;
    password = p;
    softSkills = sS;
    jobExpectation = jE;
    currentJob = cJ;
  }

  String getAppLanguage() {
    return appLanguage;
  }
}

Preferences appPreferences = Preferences();