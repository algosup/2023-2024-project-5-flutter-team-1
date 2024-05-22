// Page made by DELILLE Elone - https://github.com/HiNett
// Except from 212 to 219
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../preferences.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? checkOne = false;
  bool? checkTwo = false;
  String lang = appPreferences.getAppLanguage();

  Map<String, String> registerText = {
    "fr_FR": "Inscription",
    "en_US": "Register",
  };

  Map<String, String> aText = {
    "fr_FR": "Avant de commencer votre inscription,",
    "en_US": "Before starting your registration,"
  };

  Map<String, String> bText = {
    "fr_FR": "veuillez prendre connaissance des :",
    "en_US": "please read:"
  };

  Map<String, String> cText = {
    "fr_FR": "Conditions Générales d'Utilisation",
    "en_US": "General Conditions of Use "
  };

  Map<String, String> dText = {
    "fr_FR": "d'Adopte un Candidat",
    "en_US": "of Adopt a Candidate"
  };

  Map<String, String> rText = {
    "fr_FR": "J'ai lu et j'accepte les CGU",
    "en_US": "I have read and accept the GCU"
  };

  Map<String, String> yText = {
    "fr_FR": "Vos données sont utilisées afin de",
    "en_US": "Your data is used to put you"
  };

  Map<String, String> iText = {
    "fr_FR": "vous proposer des entreprises",
    "en_US": "in touch with companies"
  };

  Map<String, String> iaText = {
    "fr_FR":
        "J'autorise l'utilisation de mes\ndonnées pour me mettre en relation\navec des entreprises",
    "en_US": "I agree that my data be used to\nhelp me find a job"
  };

  Map<String, String> nextText = {"fr_FR": "Suivant", "en_US": "Next"};

  Map<String, String> alreadyAcc ={
    "fr_FR": "Déjà inscrit ?",
    "en_US": "Already register?"
  };

  Map<String,String> loginNow = {
    "fr_FR": "Connexion",
    "en_US": "Login"
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(50),
              child: Text(
                "${registerText[lang]}",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${aText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ))),
                Text("${bText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ))),
                Text("${cText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color.fromRGBO(0, 117, 255, 100),
                    ))),
                Text("${dText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ))),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (checkOne == false) {
                        checkOne = true;
                      } else if (checkOne == true) {
                        checkOne = false;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: checkOne,
                          activeColor: Colors.green,
                          tristate: false,
                          onChanged: (newbool) {
                            setState(() {
                              checkOne = newbool;
                            });
                          }),
                      Text("${rText[lang]}",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: checkOne! ? Colors.green : Colors.black,
                          )))
                    ],
                  ),
                ),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${yText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))),
                Text("${iText[lang]}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (checkTwo == false) {
                        checkTwo = true;
                      } else if (checkTwo == true) {
                        checkTwo = false;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: checkTwo,
                        activeColor: Colors.green,
                        tristate: false,
                        onChanged: (newbool) {
                          setState(() {
                            checkTwo = newbool;
                          });
                        },
                      ),
                      Text("${iaText[lang]}",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: checkTwo! ? Colors.green : Colors.black,
                          ))),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Align made by Enzo GUILLOUCHE
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    "assets/images/RegisterImage.png",
                    width: size.width * 0.4,
                  ),
                ),
                Column( children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (checkOne == true && checkTwo == true) {
                        context.go("/registerpage2");
                      }
                    });
                  },
                  child: Container(
                    width: size.width * 0.5,
                    height: size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                          (checkOne! && checkTwo!) ? Colors.green : Colors.grey,
                    ),
                    child: Center(
                      child: Text("${nextText[lang]}",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      context.go("/loginpage");
                    });
                  },
                  child:
                Row(children: [
                  Text("${alreadyAcc[lang]} ", style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    )
                  )),
                  Text("${loginNow[lang]}", style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(0, 117, 255, 100)
                    )
                  ))
                ],))
                
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}