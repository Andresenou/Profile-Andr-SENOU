import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
//ehdhdhdkjkff
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'À Propos de Moi',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isLargeScreen = constraints.maxWidth > 800;
              return Flex(
                direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isLargeScreen ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/about.jpg',
                            fit: BoxFit.cover,
                           // width: isLargeScreen ? 300 : double.infinity,
                            //height: isLargeScreen ? 300 : 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildInfoCard(
                          'Personnalité',
                          [
                            'Créatif et innovant',
                            'Esprit d\'équipe',
                            'Passionné par la technologie',
                            'Apprentissage continu',
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (isLargeScreen) const SizedBox(width: 40) else const SizedBox(height: 20),
                  Expanded(
                    flex: isLargeScreen ? 2 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Qui suis-je ?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Je suis un ingénieur passionné par la technologie et l\'innovation. '
                              'Mon parcours diversifié m\'a permis d\'acquérir des compétences dans plusieurs domaines, '
                              'notamment l\'énergie, le développement mobile et la maintenance informatique.\n\n'
                              'Ma formation en génie énergétique, combinée à mes compétences en programmation, '
                              'me permet d\'avoir une approche unique dans la résolution de problèmes et '
                              'le développement de solutions innovantes.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildSkillsSection(isLargeScreen),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 15),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
                  const SizedBox(width: 10),
                  Text(item),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(bool isLargeScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mes Compétences',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: isLargeScreen ? 20 : 10,
          runSpacing: 20,
          children: [
            _buildSkillCard('Développement Flutter', 85),
            _buildSkillCard('Maintenance GSM', 90),
            _buildSkillCard('Énergie Solaire', 80),
            _buildSkillCard('Arduino', 75),
            _buildSkillCard('Python', 70),
            _buildSkillCard('C/C++', 65),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillCard(String skill, double percentage) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const SizedBox(height: 5),
          Text('${percentage.toInt()}%'),
        ],
      ),
    );
  }
}
