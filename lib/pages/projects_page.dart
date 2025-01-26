import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mon_profile/pages/videos_page.dart';

class Project {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;

  const Project({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
  });
}

class ProjectsPage extends StatelessWidget {
   ProjectsPage({super.key});
  final List<Project> projects = [
    const Project(
      title: 'Installation Solaire Résidentielle',
      description: 'Installation complète d\'un système solaire pour une résidence, incluant le dimensionnement et la configuration.',
      imagePath: 'assets/images/projects/solar_home.jpg',
      technologies: ['Panneaux Solaires', 'Onduleurs', 'Batteries'],
    ),
    const Project(
      title: 'Application Mobile de Suivi',
      description: 'Développement d\'une application mobile pour le suivi de la production d\'énergie solaire.',
      imagePath: 'assets/images/projects/app_solar.jpg',
      technologies: ['Flutter', 'Firebase', 'API REST'],
    ),
    const Project(
      title: 'Réparation Smartphones',
      description: 'Service de réparation et maintenance de smartphones de différentes marques.',
      imagePath: 'assets/images/projects/phone_repair.jpg',
      technologies: ['Hardware', 'Software', 'Diagnostic'],
    ),
    const Project(
      title: 'Projet Arduino',
      description: 'Système de monitoring environnemental utilisant Arduino pour la collecte de données.',
      imagePath: 'assets/images/projects/arduino.jpg',
      technologies: ['Arduino', 'Capteurs', 'IoT'],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Mes Projets',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: _calculateCrossAxisCount(constraints),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childCount: projects.length,
                    itemBuilder: (context, index) {
                      return _ProjectCard(project: projects[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BoxConstraints constraints) {
    if (constraints.maxWidth > 1200) return 4;
    if (constraints.maxWidth > 800) return 3;
    if (constraints.maxWidth > 600) return 2;
    return 1;
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 300;

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    project.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: project.technologies.map((tech) => Chip(
                        label: Text(
                          tech,
                          style: TextStyle(
                            fontSize: isNarrow ? 10 : 12,
                          ),
                        ),
                        backgroundColor: Colors.blue.withOpacity(0.1),
                      )).toList(),
                    ),
                    //VideosPage()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}