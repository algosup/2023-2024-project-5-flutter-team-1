import 'package:flutter/material.dart';
import 'notificationspage.dart';
import 'languagepage.dart';
import 'helppage.dart';
import 'securitypage.dart';
import 'aboutpage.dart';
import 'privacypage.dart';

class SettingsPage extends StatelessWidget {
  final Map<String, String> settings;
  final String appLanguage;

  const SettingsPage(this.settings, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguagePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Privacy'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('Security'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecurityPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
