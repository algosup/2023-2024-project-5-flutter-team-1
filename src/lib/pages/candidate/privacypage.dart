import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  final Map<String, String> privacy;

  const PrivacyPage(this.privacy, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            privacy[Localizations.localeOf(context).toString()] ?? "Privacy"),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Introduction",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We value your privacy and are committed to protecting your personal information. This privacy policy explains how we collect, use, and disclose information about you when you use our services.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Information We Collect",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "1. Information you provide to us directly:\n"
                "- Personal Information: name, email address, phone number, etc.\n"
                "- Content Information: photos, comments, and other content you provide.\n"
                "- Communication Information: messages and information you provide when contacting us.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "2. Information we collect automatically:\n"
                "- Usage Information: information about your activity on our services.\n"
                "- Device Information: information about the device you use to access our services.\n"
                "- Location Information: information about your location.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How We Use Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We use the information we collect to:\n"
                "- Provide, maintain, and improve our services.\n"
                "- Communicate with you, including sending updates and notifications.\n"
                "- Personalize your experience and provide content and features that match your interests.\n"
                "- Analyze usage and trends to improve our services and develop new features.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How We Share Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We may share your information with:\n"
                "- Third-party service providers: companies that provide services on our behalf.\n"
                "- Business partners: companies we partner with to offer joint services.\n"
                "- Legal and safety reasons: to comply with legal obligations or protect our rights and safety.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Your Choices",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "You have the following choices regarding your information:\n"
                "- Access and update your information: you can access and update your personal information through your account settings.\n"
                "- Delete your information: you can request the deletion of your personal information by contacting us.\n"
                "- Opt-out of communications: you can opt-out of receiving promotional communications from us.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "If you have any questions about this privacy policy, please contact us at privacy@example.com.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
