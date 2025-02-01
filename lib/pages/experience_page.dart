import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildExperienceGrid(context),
            const SizedBox(height: 48),
            _buildTimelineSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      child: Text(
        'Mes Expériences',
        style: GoogleFonts.playfairDisplay(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildExperienceGrid(BuildContext context) {
    final experiences = [
      const ExperienceData(
        title: 'Technicien mobile GSM',
        company: 'ST MATHINOS, PORTO-NOVO',
        period: 'Juillet 2023 - Novembre 2023',
        imagePath: 'assets/images/gsm.jpg',
        description: 'Réparation et maintenance de téléphones mobiles\n'
            'Diagnostic et résolution de problèmes hardware et software\n'
            'Service client et conseil',
      ),
      const ExperienceData(
        title: 'Graphisme',
        company: 'FENAJEEB, CALAVI',
        period: 'Août 2021 - Septembre 2021',
        imagePath: 'assets/images/design.jpg',
        description: 'Création de designs graphiques\n'
            'Conception de logos et supports marketing\n'
            'Utilisation d\'outils de design professionnels',
      ),
      const ExperienceData(
        title: 'Installation Solaire',
        company: 'H4-SERVICES, AVRANKOU',
        period: 'Août 2020 - Décembre 2020',
        imagePath: 'assets/images/solar.jpg',
        description: 'Installation de systèmes solaires photovoltaïques\n'
            'Dimensionnement et configuration\n'
            'Maintenance et suivi des installations',
      ),
      // Ajout des expériences et projets de stage à Biolab
      const ExperienceData(
        title: 'Développement du dispositif QameleO',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/qameleo.jpg', // Remplacez par le chemin de l'image
        description: 'Conception et mise en œuvre d\'un système de surveillance de la qualité de l\'air dans les écoles.\n'
            'Maintenance régulière des dispositifs installés.\n'
            'Analyse des données environnementales en temps réel.\n'
            'Utilisation de capteurs de particules fines (PM1, PM2.5, PM10) et de température/humidité.\n'
            'Intégration de microcontrôleurs Arduino et ESP32.',
      ),
      const ExperienceData(
        title: 'Détection de visage pour allumer une lampe',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/face_detection.png', // Remplacez par le chemin de l'image
        description: 'Développement d\'un système de détection de visage pour allumer une lampe.\n'
            'Utilisation d\'une caméra et d\'un microcontrôleur Arduino.\n'
            'Programmation en Python pour la détection de visage.',
      ),
      const ExperienceData(
        title: 'Affichage des données de température et d\'humidité',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/dht11.jpg', // Remplacez par le chemin de l'image
        description: 'Configuration d\'un capteur DHT11 pour mesurer la température et l\'humidité.\n'
            'Affichage des données en temps réel sur un moniteur série via un ESP32.',
      ),
      const ExperienceData(
        title: 'Envoi de données vers Google Sheets',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/google_sheets.jpg', // Remplacez par le chemin de l'image
        description: 'Configuration d\'un ESP32 pour envoyer des données (température et humidité) vers Google Sheets.\n'
            'Utilisation de Google Apps Script pour le traitement des données.',
      ),
      const ExperienceData(
        title: 'Programmation d\'une carte ESP32 pour lire les codes RFID',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/rfid.jpg', // Remplacez par le chemin de l'image
        description: 'Programmation d\'une carte RFID avec un ESP32 pour lire les codes UID.\n'
            'Affichage des données en format décimal et hexadécimal.\n'
            'Envoi des données à Google Sheets pour stockage.',
      ),
      const ExperienceData(
        title: 'Développement d\'une page web pour contrôler une lampe',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/web_control.jpg', // Remplacez par le chemin de l'image
        description: 'Création d\'une interface web pour contrôler une lampe connectée à un ESP32.\n'
            'Utilisation de HTML, JavaScript et ESP32 pour l\'interaction en temps réel.',
      ),
      const ExperienceData(
        title: 'Modélisation 3D d\'une boîte pour ESP32 et RFID',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/3d_modeling.jpg', // Remplacez par le chemin de l'image
        description: 'Conception et modélisation 3D d\'une boîte pour intégrer un ESP32, une carte RFID et un module d\'horloge.\n'
            'Utilisation de Fusion 360 et impression 3D pour la fabrication du boîtier.',
      ),
      const ExperienceData(
        title: 'Configuration d\'une Raspberry Pi pour mesurer la température',
        company: 'Biolab, Cotonou',
        period: 'Juillet 2024 - Septembre 2024',
        imagePath: 'assets/images/raspberry_pi.jpg', // Remplacez par le chemin de l'image
        description: 'Développement d\'un système utilisant un capteur de température DS18B20.\n'
            'Collecte et affichage des données en temps réel sur une Raspberry Pi.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth > 900;
        final isMediumScreen = constraints.maxWidth > 600;

        if (isLargeScreen) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemCount: experiences.length,
            itemBuilder: (context, index) => _buildExperienceCard(experiences[index]),
          );
        } else if (isMediumScreen) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.85,
            ),
            itemCount: experiences.length,
            itemBuilder: (context, index) => _buildExperienceCard(experiences[index]),
          );
        } else {
          return Column(
            children: experiences.map((exp) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _buildExperienceCard(exp),
            )).toList(),
          );
        }
      },
    );
  }

  Widget _buildExperienceCard(ExperienceData experience) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue.shade50,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),

                child: Image.asset(
                  experience.imagePath,
                  fit: BoxFit.cover,
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    experience.company,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      experience.period,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    experience.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Parcours Professionnel',
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800,
          ),
        ),
        const SizedBox(height: 32),
        ..._buildTimelineItems(),
      ],
    );
  }
  List<Widget> _buildTimelineItems() {
    return [
      _buildTimelineItem(
        '2024',
        'Développement du dispositif QameleO',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Détection de visage pour allumer une lampe',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Affichage des données de température et d\'humidité',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Envoi de données vers Google Sheets',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Programmation d\'une carte ESP32 pour lire les codes RFID',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Développement d\'une page web pour contrôler une lampe',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Modélisation 3D d\'une boîte pour ESP32 et RFID',
        'Biolab, Cotonou',
        true,
      ),
      _buildTimelineItem(
        '2024',
        'Configuration d\'une Raspberry Pi pour mesurer la température',
        'Biolab, Cotonou',
        false,
      ),
      _buildTimelineItem(
        '2023',
        'Technicien mobile GSM',
        'ST MATHINOS, PORTO-NOVO',
        true,
      ),
      _buildTimelineItem(
        '2021',
        'Graphiste',
        'FENAJEEB, CALAVI',
        true,
      ),
      _buildTimelineItem(
        '2020',
        'Installateur Solaire',
        'H4-SERVICES, AVRANKOU',
        false,
      ),
    ];
  }

  Widget _buildTimelineItem(String year, String title, String company, bool showLine) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                year,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade200,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                if (showLine)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.shade800,
                            Colors.blue.shade200,
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceData {
  final String title;
  final String company;
  final String period;
  final String imagePath;
  final String description;

  const ExperienceData({
    required this.title,
    required this.company,
    required this.period,
    required this.imagePath,
    required this.description,
  });
}