import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  final Map<String, String> security;

  const SecurityPage(this.security, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            security[Localizations.localeOf(context).toString()] ?? "Security"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Security Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Change Password"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to change password
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Two-Factor Authentication",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Enable Two-Factor Authentication"),
                trailing: Switch(
                  value: true, // Replace with actual value
                  onChanged: (bool value) {
                    // Handle enable/disable two-factor authentication
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Login Activity",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("View Login Activity"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to view login activity
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Devices",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Manage Devices"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to manage devices
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Account Recovery",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Account Recovery Options"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to manage account recovery options
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Security Alerts",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Manage Security Alerts"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap to manage security alerts
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
