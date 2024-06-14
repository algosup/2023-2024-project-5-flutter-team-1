import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
      ),
      body: const Center(
        child: Text(
          'Privacy Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
