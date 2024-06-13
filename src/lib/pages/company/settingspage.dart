import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  var size;
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  String appLanguage;
  Settings(this.size, this.settings, this.appLanguage, {super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
