import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;

            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildPageTitle(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenWidth * 0.9, // Responsive height for carousel
                  child: _buildExperienceCarousel(),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildTimelineSection(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageTitle() {
    return Text(
      'Mes Expériences',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: Colors.blue[800],
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildExperienceCarousel() {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.85),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _buildExperienceCard(
            index == 0
                ? const ExperienceData(
              title: 'Technicien mobile GSM',
              company: 'ST MATHINOS, PORTO-NOVO',
              period: 'Juillet 2023 - Novembre 2023',
              imagePath: 'assets/images/gsm.jpg',
              description: 'Réparation et maintenance de téléphones mobiles\n'
                  'Diagnostic et résolution de problèmes hardware et software\n'
                  'Service client et conseil',
            )
                : index == 1
                ? const ExperienceData(
              title: 'Graphisme',
              company: 'FENAJEEB, CALAVI',
              period: 'Août 2021 - Septembre 2021',
              imagePath: 'assets/images/design.jpg',
              description: 'Création de designs graphiques\n'
                  'Conception de logos et supports marketing\n'
                  'Utilisation d\'outils de design professionnels',
            )
                : const ExperienceData(
              title: 'Installation Solaire',
              company: 'H4-SERVICES, AVRANKOU',
              period: 'Août 2020 - Décembre 2020',
              imagePath: 'assets/images/solar.jpg',
              description: 'Installation de systèmes solaires photovoltaïques\n'
                  'Dimensionnement et configuration\n'
                  'Maintenance et suivi des installations',
            ),
          ),
        );
      },
    );
  }

  Widget _buildExperienceCard(ExperienceData experience) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                experience.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  experience.company,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  experience.period,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  experience.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Parcours Professionnel',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.blue[800],
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        ..._buildTimelineItems(),
      ],
    );
  }

  List<Widget> _buildTimelineItems() {
    return [
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                color: Colors.blue[700],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
              if (showLine)
                SizedBox(
                  width: 2,
                  height: 50,
                  child: ColoredBox(color: Colors.blue[600]!),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                company,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
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
