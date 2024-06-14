import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Text(
          'About Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
