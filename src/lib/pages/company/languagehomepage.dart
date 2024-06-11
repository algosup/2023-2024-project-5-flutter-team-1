// File made by DELILLE Elone - https://github.com/HiNett
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:src/preferences.dart';

class GetUserDataCompany {
  Future<String> get folderLocalization async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get fileLocalization async {
    final path = await folderLocalization;
    return File("$path/myFile.txt");
  }

  Future<String> userMacAddress() async {
    final file = await fileLocalization;
    String macAddress = await file.readAsString();
    return macAddress;
  }

  Future<bool> postUserLang(bool english) async {
    String address = await userMacAddress();
    String language = english ? "en_US" : "fr_FR";
    final url = await http.post(
        Uri.parse("https://ffeur.pq.lu/v1/data/getApi/setUserLanguage.php"),
        body: {'mac': address, 'language': language});

    if (url.statusCode == 200) {
      final jsonResponse = jsonDecode(url.body);
      return jsonResponse['success'];
    } else {
      print('Failed to update language with status code: ${url.statusCode}');
      return false;
    }
  }

  void setLang(bool english) {
    if (english == true) {
      appPreferences.setLanguage("en_US");
    } else if (english == false) {
      appPreferences.setLanguage("fr_FR");
    }
  }
}

class LanguageHomePageCompany extends StatefulWidget {
  const LanguageHomePageCompany({super.key, required this.storage});

  final GetUserDataCompany storage;
  @override
  State<LanguageHomePageCompany> createState() => _LanguageHomePageCompanyState();
}

class _LanguageHomePageCompanyState extends State<LanguageHomePageCompany> {
  // Variables :
  /*
   * bool frenchSelected :
   *    French Selected variable is used to setup the language on the page (French)
   * bool englishSelected :
   *    English Selected variable is used to setup the language on the page (English)
   * String? macAddress :
   *    The macAddress string is used to store the user macAddress and communicate with the Database to fetch user informations
   */
  bool frenchSelected = false;
  bool englishSelected = true;
  String? macAddress;

  @override
  void initState() {
    super.initState();
    getMacAddress();
  }

  void getMacAddress() async {
    macAddress = await widget.storage.userMacAddress();
  }

  // Main Page
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 41, 41, 100),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      englishSelected
                          ? "ADOPT A CANDIDATE"
                          : "ADOPTE UN CANDIDAT",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/languagehomepage.png"),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          englishSelected
                              ? "Choose your language"
                              : "Choisis ta langue",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedLanguage("en_US"),
                        const SizedBox(width: 20),
                        selectedLanguage("fr_FR"),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.storage.postUserLang(englishSelected);
                        widget.storage.setLang(englishSelected);
                        setState(() {
                          context.go("/loginpage");
                        });
                      },
                      child: Container(
                        width: size.width * 0.2,
                        height: size.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            englishSelected ? "Next" : "Suivant",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget
  /*
   * selectedLanguage(String language) widget is used on the Main Page to displays the boxes
   *    @param language : here you can only enter "fr_FR" or "en_US", else it will put the default value "en_US"
   * 
   * bool isSelected is a variable used to change the page language when a box is selected (French or English box)
   * 
   * Map<bool, Color> mapColor is a map that contains box color on selection
   * For example: if frenchSelected is set to true, then the box will be using the "true: Colors.white" from the Map, else it will use the 
   *             "false: const Color.fromRGBO(92, 134, 203, 35)"
   * 
   * Map<bool, Color> textColor is a map that contains text color on selection
   * For example: if englishSelected is set to true, then the text will change from "Colors.white" to "Colors.black"
   * 
   * Map<String, String> flagSelection is part of the creation of the box.
   * On widget call, the "String language" (fr_FR || en_US) is used to set also the flags.
   * For example : selectedLanguage("fr_FR") will display the french box, and used the flagSelection to used the right asset for the French Flag
   * Flags are images (80x80 Pixels)
   * 
   * Map<String, String> languageText is the displayed text on the box
   * Using the @param language, we know that for the selectedLanguage("en_US") the box will display "English" if englishSelected
   * variable is true. Else, if the variable englishSelected is false (frenchSelected is true) then the selectedLanguage("en_US")
   * will display "Anglais"
   * 
   * The widget will return a GestureDetector Widget
   * 
   * Inside this GestureDetector we put a onTap detector to handle user action "Tap"
   * onTap use setState() to edit the page states and edit it on real time
   * setState() edit the variables frenchSelected and englishSelected to false or true, that edit automatically the language on
   * the page to English or French
   * 
   * Container() return the box with all the informations, relative to the Maps :
   *  - Flag
   *  - Text
   *  - Color
   */
  Widget selectedLanguage(String language) {
    var size = MediaQuery.of(context).size;

    bool isSelected = (language == "fr_FR" && frenchSelected) ||
        (language == "en_US" && englishSelected);

    Map<bool, Color> mapColor = {
      true: Colors.white,
      false: const Color.fromRGBO(92, 134, 203, 35),
    };

    Map<bool, Color> textColor = {
      true: Colors.black,
      false: Colors.white,
    };

    Map<String, String> flagSelection = {
      "fr_FR": "assets/images/FrenchFlag.png",
      "en_US": "assets/images/EnglishFlag.png",
    };

    Map<String, String> languageText = {
      "fr_FR": frenchSelected ? "Français" : "French",
      "en_US": englishSelected ? "English" : "Anglais",
    };

    return GestureDetector(
      onTap: () {
        setState(() {
          if (language == "fr_FR") {
            if (!frenchSelected) {
              frenchSelected = true;
              englishSelected = false;
            }
          } else if (language == "en_US") {
            if (!englishSelected) {
              englishSelected = true;
              frenchSelected = false;
            }
          }
        });
      },
      child: Container(
        width: size.width * 0.16,
        height: size.width * 0.16,
        decoration: BoxDecoration(
          color: mapColor[isSelected],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${flagSelection[language]}'),
              Text(
                '${languageText[language]}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: textColor[isSelected],
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
