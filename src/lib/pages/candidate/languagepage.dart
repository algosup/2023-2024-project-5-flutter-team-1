import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  final Map<String, String> language;

  const LanguagePage(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            language[Localizations.localeOf(context).toString()] ?? "Language"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Language Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select your preferred language",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              RadioListTile(
                title: const Text("English"),
                value: "en_US",
                groupValue: Localizations.localeOf(context).toString(),
                onChanged: (String? value) {
                  // Handle change to English
                },
              ),
              RadioListTile(
                title: const Text("Français"),
                value: "fr_FR",
                groupValue: Localizations.localeOf(context).toString(),
                onChanged: (String? value) {
                  // Handle change to French
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Regional Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Region"),
                subtitle: const Text("Select your region"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to change region
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Date and Time Format",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Date Format"),
                subtitle: const Text("Select date format"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to change date format
                },
              ),
              ListTile(
                title: const Text("Time Format"),
                subtitle: const Text("Select time format"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to change time format
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
