import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  var size;
  Map<String, String> profile = {
    "fr_FR": "Profil",
    "en_US": "Profile",
  };
  String appLanguage;
  Profile(this.size, this.profile, this.appLanguage, {super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
