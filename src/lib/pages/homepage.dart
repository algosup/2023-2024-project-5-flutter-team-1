import 'package:flutter/material.dart';
import '../preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String appLanguage = "fr_FR";
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
  @override
  void initState(){
    super.initState();
    print("Mac Address: ${appPreferences.macAddress}\nFN: ${appPreferences.firstName}\nLN: ${appPreferences.lastName}\nBD: ${appPreferences.birthDate}");
    print("BC: ${appPreferences.birthCity}\nRC: ${appPreferences.residenceCity}\nE: ${appPreferences.email}\nP: ${appPreferences.password}\nSS: ${appPreferences.softSkills}");
    print("JE: ${appPreferences.jobExpectation}\nCJ: ${appPreferences.currentJob}");

  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}