import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final Map<String, String> settings;

  const AboutPage(this.settings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settings['fr_FR'] == 'fr_FR' ? 'À propos' : 'About'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'À propos de cette application'
                    : 'About this App',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'Cette application a été développée pour fournir une solution intuitive et conviviale pour la gestion des candidats. Notre objectif est de simplifier le processus de sélection et d\'améliorer l\'expérience utilisateur.'
                    : 'This app was developed to provide an intuitive and user-friendly solution for candidate management. Our goal is to streamline the selection process and enhance the user experience.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'Fonctionnalités principales'
                    : 'Key Features',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? '• Gestion des candidats\n• Sélection basée sur les compétences\n• Interface utilisateur intuitive\n• Notifications en temps réel\n• Support multilingue'
                    : '• Candidate management\n• Skill-based selection\n• Intuitive user interface\n• Real-time notifications\n• Multilingual support',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'Équipe de développement'
                    : 'Development Team',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'Notre équipe est composée de développeurs passionnés, de designers UX/UI et de gestionnaires de projet qui travaillent ensemble pour créer des solutions innovantes.'
                    : 'Our team is composed of passionate developers, UX/UI designers, and project managers working together to create innovative solutions.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                settings['fr_FR'] == 'fr_FR' ? 'Contact' : 'Contact',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                settings['fr_FR'] == 'fr_FR'
                    ? 'Si vous avez des questions ou des commentaires, n\'hésitez pas à nous contacter à support@example.com.'
                    : 'If you have any questions or feedback, feel free to contact us at support@example.com.',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
