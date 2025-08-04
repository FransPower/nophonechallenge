import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Over de App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.emoji_events_outlined, // Kies een passend icon
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Onze Missie',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'Waarom deze app?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Curabitur pretiu massa nec nisi varius, a tristique magna efficitur. Mauris at enim vel nisi bibendum tincidunt. Vivamus vitae efficitur urna. Nam ac eros id odio fringilla mollis id a enim.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'Versie Informatie',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('App Versie'),
                trailing: Text('1.0.0', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Ontwikkelaars'),
                trailing: Text('Jouw Naam', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: Navigeer naar privacybeleid / gebruiksvoorwaarden
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigeer naar Privacybeleid')),
                  );
                },
                child: Text(
                  'Privacybeleid & Gebruiksvoorwaarden',
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}