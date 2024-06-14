import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: const Center(
        child: Text(
          'Security Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
