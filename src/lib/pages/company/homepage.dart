import 'package:flutter/material.dart';
import 'package:src/preferences.dart';
import 'chatpage.dart';
import 'settingspage.dart';
import 'profilepage.dart';

class HomePageCompany extends StatefulWidget {
  const HomePageCompany({super.key});

  @override
  State<HomePageCompany> createState() => _HomePageCompanyState();
}

class _HomePageCompanyState extends State<HomePageCompany> {
  String appLanguage = appPreferences.appLanguage;
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

  Map<String, String> adoptCandidate = {
    "fr_FR": "Adopte un Candidat",
    "en_US": "Adopt a Candidate",
  };
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  Map<String, String> profile = {
    "fr_FR": "Profil",
    "en_US": "Profile",
  };

  // the index of the page
  int _selectedIndex = 0;

  // change the index of the page
  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    List<Widget> pages = [
      ChatManager(size, appLanguage),
      Settings(size, appLanguage),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Center(
                child: Text(
                  "${adoptCandidate[appLanguage]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            pages[_selectedIndex],
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: size.width * 0.6,
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF424242), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              isSelected: _selectedIndex == 0,
              icon: const Icon(Icons.home_outlined, color: Colors.white),
              selectedIcon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                setState(() {
                  _onItemTapped(0);
                });
              },
            ),
            IconButton(
              isSelected: _selectedIndex == 1,
              icon: const Icon(Icons.settings_outlined, color: Colors.white),
              selectedIcon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                setState(() {
                  _onItemTapped(1);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
