import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 800;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1, child: _buildContactSection()),
                        const SizedBox(width: 40),
                        Expanded(flex: 2, child: _buildMessageCard()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactSection(),
                        const SizedBox(height: 30),
                        _buildMessageCard(),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Restons en Contact',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildContactInfo(
          FontAwesomeIcons.phone,
          '+229 96322349',
          'tel:+22996322349',
        ),
        _buildContactInfo(
          FontAwesomeIcons.envelope,
          'andresenou3@gmail.com',
          'mailto:andresenou3@gmail.com',
        ),
        _buildContactInfo(
          FontAwesomeIcons.locationDot,
          'Béninoise',
          null,
        ),
        const SizedBox(height: 30),
        const Text(
          'Réseaux Sociaux',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildSocialButton(
              FontAwesomeIcons.linkedin,
              Colors.blue,
              'https://www.linkedin.com/in/senou-andr%C3%A9-5843062a1',
            ),
            const SizedBox(width: 20),
            _buildSocialButton(
              FontAwesomeIcons.github,
              Colors.black,
              'https://github.com/',
            ),
            const SizedBox(width: 20),
            _buildSocialButton(
              FontAwesomeIcons.twitter,
              Colors.blue,
              'https://twitter.com/',
            ),
            const SizedBox(width: 20),
            _buildSocialButton(
              FontAwesomeIcons.facebook,
              Colors.blue,
              'https://www.facebook.com/andre.senou?locale=fr_FR',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageCard() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Envoyez-moi un message',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Nom', _nameController),
            const SizedBox(height: 15),
            _buildTextField('Email', _emailController),
            const SizedBox(height: 15),
            _buildTextField('Sujet', _subjectController),
            const SizedBox(height: 15),
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'andresenou3@gmail.com',
                  queryParameters: {
                    'subject': _subjectController.text,
                    'body': '''
Nom : ${_nameController.text}
Email : ${_emailController.text}

Message :
${_messageController.text}
                    ''',
                  },
                );

                launchUrl(emailUri.toString() as Uri);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Envoyer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text, String? url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: url != null ? () => launchUrl(url as Uri) : null,
        child: Row(
          children: [
            FaIcon(icon, color: Colors.blue),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color, String url) {
    return InkWell(
      onTap: () => launchUrl(url as Uri),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
