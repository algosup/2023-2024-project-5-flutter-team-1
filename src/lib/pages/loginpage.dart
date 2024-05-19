import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:src/preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class DataClass {
  String appLang = "en_US";

  void getAppLang() {
    appLang = appPreferences.getAppLanguage();
  }

  String setAppLang() {
    return appLang;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.storage});

  final DataClass storage;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String applicationLanguage = "en_US";
  @override
  void initState(){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: myApplication(context, applicationLanguage))
    );
  }
}

Widget myApplication(BuildContext context, String appLang) {
  Map<String, String> loginLang = {
    "fr_FR": "Connexion",
    "en_US": "Login"
  };

  Map<String, String> loginText = {
    "fr_FR": "Adresse mail",
    "en_US": "Email address"
  };

  Map<String, String> passwordText = {
    "fr_FR": "Mot de passe",
    "en_US": "Password"
  };
  
  Map<String, String> forgotPassword = {
    "fr_FR": "Mot de passe oublié ?",
    "en_US": "Forgotten password ?"
  };

  Map <String, String> buttonText = {
    "fr_FR": "Se connecter",
    "en_US": "Login"
  };

  Map<String, String> noAcc = {
    "fr_FR": "Pas de compte ?",
    "en_US": "No account ?"
  };

  Map<String, String> regNow = {
    "fr_FR": "S'inscrire",
    "en_US": "Register now"
  };

  var size = MediaQuery.sizeOf(context);

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${loginLang[appLang]}", style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 30,
              ),
            ),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/LoginImage.png")
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 100),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset("assets/images/Default.png"),
                ),
                Container(
                  width: size.width * 0.6,
                  child: TextField(
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
                      fillColor: Color.fromRGBO(230, 230, 230, 100),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 100),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset("assets/images/Security.png"),
                ),
                Container(
                  width: size.width * 0.6,
                  child: TextField(
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
              ],
            ),
            GestureDetector(
              child:
                Text(
                  "${forgotPassword[appLang]}",
                  style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(80, 200, 250, 100),
                          fontSize: 15,
                        ),
                  ),
                ),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.6,
                    height: size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(142, 193, 243, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("${buttonText[appLang]}", 
                        style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),),)
                  ),
                ]
              ),
            ),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("${noAcc[appLang]}", 
                        style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                  ),),
                Text(" ${regNow[appLang]}",
                        style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(80, 200, 250, 100),
                          fontSize: 15,
                        ),
                  ),),
              ],)
            )
          ]
        )
      ],
    ),
  );
}