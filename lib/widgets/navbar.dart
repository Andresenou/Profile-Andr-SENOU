import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Affichage réactif
    if (screenWidth < 600) {
      // Affichage mobile : Utilisation d'un AppBar avec un Drawer
      return AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Mahunan André',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return _buildDrawer(context);
                },
              );
            },
          ),
        ],
      );
    } else {
      // Affichage Desktop : Barre de navigation horizontale
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.blue.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Mahunan André',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _buildNavItem(0, 'Accueil', Icons.home),
                _buildNavItem(1, 'À Propos', Icons.person),
                _buildNavItem(2, 'Expériences', Icons.work),
                _buildNavItem(3, 'Projets', Icons.folder),
                _buildNavItem(4, 'Vidéos', Icons.video_camera_back_outlined),
                _buildNavItem(5, 'Contact', Icons.email),


              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _buildNavItem(int index, String title, IconData icon) {
    final isSelected = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => onItemSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Container(
      color: Colors.blue.shade900,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDrawerItem(context, 0, 'Accueil', Icons.home),
          _buildDrawerItem(context, 1, 'À Propos', Icons.person),
          _buildDrawerItem(context, 2, 'Expériences', Icons.work),
          _buildDrawerItem(context, 3, 'Projets', Icons.folder),
          _buildDrawerItem(context, 4, 'Vidéo', Icons.video_camera_back_outlined),
          _buildDrawerItem(context, 5, 'Contact', Icons.email),

        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, int index, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        onItemSelected(index);
      },
    );
  }
}
