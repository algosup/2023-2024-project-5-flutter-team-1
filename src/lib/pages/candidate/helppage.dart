import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  final Map<String, String> help;

  const HelpPage(this.help, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(help[Localizations.localeOf(context).toString()] ?? "Help"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Help & Support",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("How to use the app?"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to show FAQs
                },
              ),
              ListTile(
                title: const Text("Account related issues"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to show FAQs
                },
              ),
              ListTile(
                title: const Text("Privacy and Security"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to show FAQs
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Email Support"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to contact via email
                },
              ),
              ListTile(
                title: const Text("Call Support"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to contact via phone
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Feedback",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Submit Feedback"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to submit feedback
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "User Guide",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("View User Guide"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to view user guide
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Troubleshooting",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Common Issues"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to view common issues
                },
              ),
              ListTile(
                title: const Text("Network Problems"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to view network problems solutions
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
