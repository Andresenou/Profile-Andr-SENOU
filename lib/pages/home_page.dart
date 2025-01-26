import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade700,
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth > 600 ? 150 : 100, // S'adapte à la taille de l'écran
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 30),
              Text(
                'Mahunan André SENOU',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 48 : 36, // Taille du texte adaptable
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 30 : 20, // Taille du texte adaptable
                  color: Colors.white70,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Elève Ingénieur en génie énergétique et Procédés',
                      speed: const Duration(milliseconds: 50), // Vitesse d'écriture
                    ),
                    TypewriterAnimatedText(
                      'Technicien de maintenance informatique (Software et Hardware)',
                      speed: const Duration(milliseconds: 50),
                    ),
                    TypewriterAnimatedText(
                      'Technicien GSM',
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(seconds: 2), // Ajout du délai ici
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Naviguer vers la section À propos
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth > 600 ? 60 : 40,
                    vertical: screenWidth > 600 ? 25 : 20,
                  ),
                ),
                child: Text(
                  'En savoir plus',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 24 : 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
