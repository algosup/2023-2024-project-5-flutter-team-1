import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final Map<String, String> notifications;

  const NotificationsPage(this.notifications, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notifications[Localizations.localeOf(context).toString()] ??
            "Notifications"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notifications Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text("Enable Notifications"),
                value: true,
                onChanged: (bool value) {
                  // Handle change
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Notification Preferences",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text("Email Notifications"),
                value: true,
                onChanged: (bool? value) {
                  // Handle change
                },
              ),
              CheckboxListTile(
                title: const Text("SMS Notifications"),
                value: false,
                onChanged: (bool? value) {
                  // Handle change
                },
              ),
              CheckboxListTile(
                title: const Text("Push Notifications"),
                value: true,
                onChanged: (bool? value) {
                  // Handle change
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Notification Frequency",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              RadioListTile(
                title: const Text("Daily"),
                value: "daily",
                groupValue: "frequency",
                onChanged: (String? value) {
                  // Handle change
                },
              ),
              RadioListTile(
                title: const Text("Weekly"),
                value: "weekly",
                groupValue: "frequency",
                onChanged: (String? value) {
                  // Handle change
                },
              ),
              RadioListTile(
                title: const Text("Monthly"),
                value: "monthly",
                groupValue: "frequency",
                onChanged: (String? value) {
                  // Handle change
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Notification Sound",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Default Sound"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                title: const Text("Custom Sound"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Do Not Disturb",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: const Text("Enable Do Not Disturb"),
                value: false,
                onChanged: (bool value) {
                  // Handle change
                },
              ),
              ListTile(
                title: const Text("Schedule"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
