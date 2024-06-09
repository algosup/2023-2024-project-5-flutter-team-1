import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:src/preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  String? lang = "en_US";
  String? dayDate;
  String? monthDate;
  String? yearDate;
  String? selectedCity;
  String? firstName;
  String? lastName;
  bool isFormFilled = false;

  void FormFilled() {
    if (firstName?.isNotEmpty == true &&
        lastName?.isNotEmpty == true &&
        selectedCity?.isNotEmpty == true &&
        dayDate != null &&
        monthDate != null &&
        yearDate != null) {
      isFormFilled = true;
    } else {
      isFormFilled = false;
    }
  }

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

  @override
  void initState() {
    super.initState();
    lang = appPreferences.appLanguage;
  }

  Map<String, String> registerText = {
    "fr_FR": "Inscription",
    "en_US": "Register"
  };

  Map<String, String> beginningText = {
    "fr_FR":
        "Chez “Adopte un Candidat”, nous privilégions l'anonymat des candidats pour éviter tout genre de discrimination.\n\nCependant, nous récupérons vos informations pour effectuer les documents administratifs si vous arrivez à matcher et à vous faire recruter par une entreprise.",
    "en_US":
        "At “Adopt a Candidate”, we prefer to keep candidates anonymous to avoid any kind of discrimination.\n\nHowever, we will use your information to complete the administrative paperwork if you are successful in being matched and recruited by a company.",
  };

  Map<String, String> myData = {
    "fr_FR": "Mes informations",
    "en_US": "My information"
  };

  Map<String, String> myName = {"fr_FR": "Prénom", "en_US": "First name"};

  Map<String, String> familyName = {
    "fr_FR": "Nom de famille",
    "en_US": "Family name"
  };

  Map<String, String> birthdayText = {
    "fr_FR": "Date d'anniversaire",
    "en_US": "Birthday"
  };

  Map<String, String> city = {
    "fr_FR": "Ville de naissance",
    "en_US": "City of birth"
  };

  Map<String, String> next = {"fr_FR": "Suivant", "en_US": "Next"};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(registerText[lang]!,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ))),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/Data.png"),
                        Container(
                          width: size.width * 0.8,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            beginningText[lang]!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )),
                          ),
                        ),
                        Text(myData[lang]!,
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
                                Text(myName[lang]!,
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
                                      firstName = newValue;
                                      FormFilled();
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
                                      fillColor: const Color.fromRGBO(
                                          230, 230, 230, 100),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                Text(familyName[lang]!,
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
                                      lastName = newValue;
                                      FormFilled();
                                    });
                                    lastName = newValue;
                                  },
                                  autocorrect: false,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  )),
                                  decoration: InputDecoration(
                                      fillColor: const Color.fromRGBO(
                                          230, 230, 230, 100),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                Text(birthdayText[lang]!,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.18,
                                    height: size.width * 0.15,
                                    child: DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        fillColor: const Color.fromRGBO(
                                            230, 230, 230, 100),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                      items: List.generate(
                                              31, (index) => index + 1)
                                          .map((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(value.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          dayDate = newValue.toString();
                                          FormFilled();
                                          print("Date Day: $dayDate");
                                        });
                                      },
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.18,
                                    height: size.width * 0.15,
                                    child: DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        fillColor: const Color.fromRGBO(
                                            230, 230, 230, 100),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                      items: List.generate(
                                              12, (index) => index + 1)
                                          .map((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(value.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          monthDate = newValue.toString();
                                          FormFilled();
                                          print("Date Month: $monthDate");
                                        });
                                      },
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.24,
                                    height: size.width * 0.15,
                                    child: DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        fillColor: const Color.fromRGBO(
                                            230, 230, 230, 100),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                      items: List.generate(
                                              100, (index) => index + 1924)
                                          .map((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(value.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          yearDate = newValue.toString();
                                          FormFilled();
                                          print("Date Year: $yearDate");
                                        });
                                      },
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: size.width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(city[lang]!,
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.15,
                              child: Autocomplete<String>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    selectedCity = "";
                                    return fetchCities('A');
                                  }
                                  return fetchCities(textEditingValue.text);
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: Material(
                                      elevation: 4.0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        constraints: const BoxConstraints(
                                            maxHeight:
                                                200), // Sets a max height for the dropdown
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: options.length,
                                          itemBuilder: (context, index) {
                                            final option =
                                                options.elementAt(index);
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
                                fieldViewBuilder: (context, controller,
                                    focusNode, onEditingComplete) {
                                  return TextField(
                                    onChanged: (String value) {
                                      setState(() {
                                        if (value == "") {
                                          selectedCity = null;
                                          FormFilled();
                                        } else {
                                          selectedCity = value;
                                          FormFilled();
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
                                      fillColor: const Color.fromRGBO(
                                          230, 230, 230, 100),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isFormFilled) {
                        String birth = "$yearDate-$monthDate-$dayDate";
                        appPreferences.registerDataOne(
                            firstName!, lastName!, birth, selectedCity!);
                        context.go("/registerpage3");
                      }
                    });
                  },
                  child: Container(
                    width: size.width * 0.5,
                    height: size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isFormFilled ? Colors.green : Colors.grey,
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
          ),
        ));
  }
}
