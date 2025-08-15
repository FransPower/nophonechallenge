import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // BELANGRIJK: Deze import moet hier staan!

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigeer naar instellingen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Instellingen geopend')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest, // Gebruik een variant kleur
                    child: Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.onSurface),
                    // Als je een profielfoto wilt:
                    // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Gebruikersnaam', // Dynamisch ophalen
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'gebruiker@example.com', // Dynamisch ophalen
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Deel je profiel met een QR-code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: QrImageView(
                  data: 'your-user-id-or-profile-link-example-12345', // Vervang met unieke data van de gebruiker
                  version: QrVersions.auto,
                  size: 200.0,
                  gapless: false,
                  // Zorg ervoor dat 'assets/app_logo.png' bestaat en is gedeclareerd in pubspec.yaml
                  embeddedImage: const AssetImage('assets/app_logo.png'),
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(40, 40),
                 ),
                  dataModuleStyle: QrDataModuleStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    dataModuleShape: QrDataModuleShape.square,
                  ),
                  eyeStyle: QrEyeStyle(
                    color: Theme.of(context).colorScheme.primary, // Ogen in paars
                    eyeShape: QrEyeShape.square,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.delete_forever_outlined, color: Colors.redAccent.shade400),
              title: Text('Account verwijderen', style: TextStyle(color: Colors.redAccent.shade400)),
              tileColor: Theme.of(context).colorScheme.surface, // Achtergrondkleur
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: () {
                // TODO: Bevestigingsdialoog voor account verwijderen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      title: Text('Account Verwijderen', style: Theme.of(context).textTheme.titleLarge),
                      content: Text('Weet je zeker dat je je account wilt verwijderen? Dit kan niet ongedaan worden gemaakt.', style: Theme.of(context).textTheme.bodyMedium),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Annuleren', style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.shade400),
                          onPressed: () {
                            // TODO: Implementeer account verwijderen logica
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Account wordt verwijderd... (Mock)')),
                            );
                            Navigator.of(context).pop(); // Sluit dialoog
                            // Eventueel uitloggen en naar loginscherm navigeren
                          },
                          child: const Text('Verwijderen'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.secondary),
                title: const Text('Notificatie Instellingen'),
                onTap: () { /* TODO: Navigeer */ },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.lock_outline, color: Theme.of(context).colorScheme.secondary),
                title: const Text('Wachtwoord Wijzigen'),
                onTap: () { /* TODO: Navigeer */ },
              ),
            ),
          ],
        ),
      ),
    );
  }
}