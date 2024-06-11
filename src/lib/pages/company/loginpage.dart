import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:src/preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class DataClassCompany {
  String appLang = "en_US";

  void getAppLang() {
    appLang = appPreferences.getAppLanguage();
  }

  String setAppLang() {
    return appLang;
  }
}

class LoginPageCompany extends StatefulWidget {
  const LoginPageCompany({super.key, required this.storage});

  final DataClassCompany storage;
  @override
  State<LoginPageCompany> createState() => _LoginPageCompanyState();
}

class _LoginPageCompanyState extends State<LoginPageCompany> {
  String applicationLanguage = "en_US";
  @override
  void initState() {
    super.initState();
    getApplicationData();
  }

  void getApplicationData() async {
    widget.storage.getAppLang();
    print("Application Language DataClass: ${widget.storage.appLang}");
    applicationLanguage = widget.storage.setAppLang();
    print("Application Language DataClass: ${widget.storage.appLang}");
    print("Application Language : $applicationLanguage");
  }

  void callNewPage(String pageName) {
    setState(() {
      context.go(pageName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child:
                      myApplication(context, applicationLanguage, callNewPage),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget myApplication(
    BuildContext context, String appLang, void Function(String) newPage) {
  Map<String, String> adoptLang = {
    "fr_FR": "ADOPTE UN CANDIDAT",
    "en_US": "ADOPT A CANDIDATE",
  };

  Map<String, String> companyLang = {
    "fr_FR": "Espace Entreprise",
    "en_US": "Company Space",
  };

  Map<String, String> loginLang = {
    "fr_FR": "Connexion",
    "en_US": "Login",
  };

  Map<String, String> loginText = {
    "fr_FR": "Adresse mail",
    "en_US": "Email address",
  };

  Map<String, String> passwordText = {
    "fr_FR": "Mot de passe",
    "en_US": "Password",
  };

  Map<String, String> forgotPassword = {
    "fr_FR": "Mot de passe oublié ?",
    "en_US": "Forgotten password ?",
  };

  Map<String, String> buttonText = {
    "fr_FR": "Se connecter",
    "en_US": "Login",
  };

  Map<String, String> noAcc = {
    "fr_FR": "Pas de compte ?",
    "en_US": "No account ?",
  };

  Map<String, String> regNow = {
    "fr_FR": "S'inscrire",
    "en_US": "Register now",
  };

  Map<String, String> allRights = {
    "fr_FR": "Adopte un Candidat® - 2024 Tous droits réservés",
    "en_US": "Adopt a Candidate® - 2024 All rights reserved",
  };

  Map<String, String> terms = {
    "fr_FR": "Termes d'Utilisation",
    "en_US": "Terms of Use",
  };

  var size = MediaQuery.sizeOf(context);

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        top(appLang, adoptLang),
        loginContainer(size, appLang, newPage, companyLang, loginLang,
            loginText, passwordText, forgotPassword, buttonText, noAcc, regNow),
        bottom(size, allRights, terms, appLang),
      ],
    ),
  );
}

Widget top(String appLang, Map<String, String> adoptLang) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          "assets/images/icon.png",
          height: 60,
        ),
      ),
      Text(
        "${adoptLang[appLang]}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ],
  );
}

Widget loginContainer(
    var size,
    String appLang,
    void Function(String) newPage,
    Map<String, String> companyLang,
    Map<String, String> loginLang,
    Map<String, String> loginText,
    Map<String, String> passwordText,
    Map<String, String> forgotPassword,
    Map<String, String> buttonText,
    Map<String, String> noAcc,
    Map<String, String> regNow) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "${companyLang[appLang]}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      Container(
        width: size.width * 0.3,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(208, 207, 207, 0.612),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "${loginLang[appLang]}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Container(
                        width: size.width * 0.035,
                        height: size.height * 0.07,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 100),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Image.asset("assets/images/Default.png"),
                      ),
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.07,
                        child: TextField(
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: "${loginText[appLang]}",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(120, 120, 120, 100),
                                fontSize: 18,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            fillColor: const Color.fromRGBO(230, 230, 230, 100),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Container(
                        width: size.width * 0.035,
                        height: size.height * 0.07,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 100),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Image.asset("assets/images/Security.png"),
                      ),
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.07,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            hintText: "${passwordText[appLang]}",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(120, 120, 120, 100),
                                fontSize: 18,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            fillColor: const Color.fromRGBO(230, 230, 230, 100),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    child: Text(
                      "${forgotPassword[appLang]}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 117, 255, 100),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: GestureDetector(
                  onTap: () {
                    newPage("/homepage");
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: size.width * 0.13,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "${buttonText[appLang]}",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${noAcc[appLang]}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        newPage("/registerpage");
                      },
                      child: Text(
                        " ${regNow[appLang]}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 117, 255, 100),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      )
    ],
  );
}

Widget bottom(var size, Map<String, String> allRights,
    Map<String, String> terms, String appLang) {
  return Container(
    height: 75,
    width: size.width,
    color: Color.fromRGBO(208, 207, 207, 0.612),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "${allRights[appLang]}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "${terms[appLang]}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  );
}
