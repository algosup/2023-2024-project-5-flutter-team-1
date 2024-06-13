import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  Map<String, String> profile = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  String appLanguage;
  ProfilePage(this.profile, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${profile[appLanguage]}',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF424242), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}