import 'package:flutter/material.dart';
import 'privacypage.dart';
import 'notificationspage.dart';
import 'languagepage.dart';
import 'securitypage.dart';
import 'helppage.dart';
import 'aboutpage.dart';

class SettingsPage extends StatelessWidget {
  final Map<String, String> settings;
  final String appLanguage;

  const SettingsPage(this.settings, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const SizedBox(height: 10),
                const Text(
                  'Hello Franck!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'franckjeannin@algosup.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: Text(
                    appLanguage == "fr_FR" ? "Confidentialité" : "Privacy",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPage(settings)),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(
                    appLanguage == "fr_FR" ? "Notifications" : "Notifications",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsPage(settings)),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                    appLanguage == "fr_FR" ? "Langue" : "Language",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LanguagePage(settings)),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: Text(
                    appLanguage == "fr_FR" ? "Sécurité" : "Security",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecurityPage(settings)),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: Text(
                    appLanguage == "fr_FR" ? "Aide" : "Help",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpPage(settings)),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: Text(
                    appLanguage == "fr_FR" ? "À propos" : "About",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutPage(settings)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
