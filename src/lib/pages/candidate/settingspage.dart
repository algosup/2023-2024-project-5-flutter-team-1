import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  String appLanguage;
  SettingsPage(this.settings, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${settings[appLanguage]}",
            style: const TextStyle(
              color: Colors.white,
            )),
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
          'Settings Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}