import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/preferences.dart';
import 'package:go_router/go_router.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  String lang = appPreferences.appLanguage;
  String? currentCityString;
  String? emailString;
  String? passwordString;
  String? softSkillsString;
  String? jobExpectationString;
  String? currentJobString;
  bool isForm2Filled = false;
  Map<String, String> next = {"fr_FR": "Suivant", "en_US": "Next"};

  Map<String, String> registerText = {
    "fr_FR": "Inscription",
    "en_US": "Register"
  };

  Map<String, String> professionnalInformations = {
    "fr_FR": "Informations professionnelles",
    "en_US": "My professionnal information"
  };

  Map<String, String> privateInformation = {
    "fr_FR": "Informations privées",
    "en_US": "Private information"
  };

  Map<String, String> currentCity = {
    "fr_FR": "Lieu d'habitation",
    "en_US": "City of residence"
  };

  Map<String, String> currentJob = {
    "fr_FR": "Métier actuel",
    "en_US": "Current job"
  };

  Map<String, String> jobExpectation = {
    "fr_FR": "Métier recherché",
    "en_US": "Expected job"
  };

  Map<String, String> softSkills = {
    "fr_FR": "Compétences humaines",
    "en_US": "Soft skills"
  };

  Map<String, String> mail = {
    "fr_FR": "Adresse mail",
    "en_US": "Email address"
  };

  void Form2Filled() {
    if (currentCityString?.isNotEmpty == true &&
        emailString?.isNotEmpty == true &&
        passwordString?.isNotEmpty == true &&
        jobExpectationString != null &&
        currentJobString != null &&
        softSkillsString != null) {
      isForm2Filled = true;
    } else {
      isForm2Filled = false;
    }
  }

  Map<String, String> password = {"fr_FR": "Mot de passe", "en_US": "Password"};

  Future<List<String>> fetchCities(String input) async {
    var url = Uri.parse(
        'https://geo.api.gouv.fr/communes?nom=$input&fields=nom&format=json&geometry=centre');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      return json.map((item) => item['nom'] as String).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<bool> createUser() async {
    try {
      var response = await http.post(
          Uri.parse("https://ffeur.pq.lu/v1/data/useApi/userCreation.php"),
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: {
            'fn': appPreferences.firstName,
            'ln': appPreferences.lastName,
            'bD': appPreferences.birthDate,
            'bC': appPreferences.birthCity,
            'rC': currentCityString,
            'email': emailString,
            'pass': passwordString,
            'sS': softSkillsString,
            'cJ': currentJobString,
            'jE': jobExpectationString,
          });
      print("We did manage to send the POST");
      var ok = response.statusCode;
      print("Status code received: $ok");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("Response from server: $body");
        return body['success'] ?? false;
      }
      return false;
    } catch (e) {
      print("HTTP request failed: $e");
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getAppPreferences();
  }

  void getAppPreferences() {
    print(appPreferences.firstName);
    print(appPreferences.lastName);
    print(appPreferences.birthDate);
    print(appPreferences.birthCity);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("${registerText[lang]}",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Flex(
                direction: Axis.vertical,
                children: [
                  Text(professionnalInformations[lang]!,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ))),
                ],
              ),
              SizedBox(
                  width: size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(currentCity[lang]!,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )))
                    ],
                  )),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              currentCityString = "";
                              return fetchCities('A');
                            }
                            return fetchCities(textEditingValue.text);
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 4.0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  constraints:
                                      const BoxConstraints(maxHeight: 200),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: options.length,
                                    itemBuilder: (context, index) {
                                      final option = options.elementAt(index);
                                      return ListTile(
                                        title: Text(option),
                                        onTap: () {
                                          onSelected(option);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onEditingComplete) {
                            return TextField(
                              onChanged: (String value) {
                                setState(() {
                                  if (value == "") {
                                    currentCityString = null;
                                    Form2Filled();
                                  } else {
                                    currentCityString = value;
                                    Form2Filled();
                                  }
                                });
                              },
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              )),
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 100),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      width: size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(currentJob[lang]!,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )))
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width * 0.6,
                          height: size.width * 0.15,
                          child: TextField(
                            onChanged: (String newValue) {
                              setState(() {
                                currentJobString = newValue;
                                Form2Filled();
                              });
                            },
                            autocorrect: false,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )),
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 100),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      width: 0,
                                    ))),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(jobExpectation[lang]!,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )))
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width * 0.6,
                          height: size.width * 0.15,
                          child: TextField(
                            onChanged: (String newValue) {
                              setState(() {
                                jobExpectationString = newValue;
                                Form2Filled();
                              });
                            },
                            autocorrect: false,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )),
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 100),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      width: 0,
                                    ))),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(softSkills[lang]!,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )))
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width * 0.6,
                          height: size.width * 0.15,
                          child: TextField(
                            onChanged: (String newValue) {
                              setState(() {
                                softSkillsString = newValue;
                                Form2Filled();
                              });
                            },
                            autocorrect: false,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )),
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 100),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      width: 0,
                                    ))),
                          )),
                    ],
                  ),
                ],
              ),
              Flex(
                direction: Axis.vertical,
                children: [
                  Text(privateInformation[lang]!,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ))),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      width: size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(mail[lang]!,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )))
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width * 0.6,
                          height: size.width * 0.15,
                          child: TextField(
                            onChanged: (String newValue) {
                              setState(() {
                                emailString = newValue;
                                Form2Filled();
                              });
                            },
                            autocorrect: false,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )),
                            decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(230, 230, 230, 100),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                      width: 0,
                                    ))),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                  width: size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(password[lang]!,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )))
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: size.width * 0.6,
                      height: size.width * 0.15,
                      child: TextField(
                        obscureText: true,
                        onChanged: (String newValue) {
                          setState(() {
                            passwordString = newValue;
                          });
                        },
                        autocorrect: false,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        )),
                        decoration: InputDecoration(
                            fillColor: const Color.fromRGBO(230, 230, 230, 100),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                  width: 0,
                                ))),
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isForm2Filled) {
                      appPreferences.registerDataTwo(
                          currentCityString!,
                          emailString!,
                          passwordString!,
                          softSkillsString!,
                          jobExpectationString!,
                          currentJobString!);
                      createUser();
                      context.go("/homepage");
                    }
                  });
                },
                child: Container(
                  width: size.width * 0.5,
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isForm2Filled ? Colors.green : Colors.grey,
                  ),
                  child: Center(
                    child: Text("${next[lang]}",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ))),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
