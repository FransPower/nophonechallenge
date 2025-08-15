import 'package:flutter/material.dart';

class AddChallengeScreen extends StatefulWidget {
  const AddChallengeScreen({super.key});

  @override
  State<AddChallengeScreen> createState() => _AddChallengeScreenState();
}

class _AddChallengeScreenState extends State<AddChallengeScreen> {
  double _betCoins = 1.0; // Standaard inzet
  final List<String> _selectedApps = [];
  final List<String> _availableApps = ['Instagram', 'TikTok', 'Facebook', 'YouTube', 'Twitter', 'Snapchat', 'Reddit', 'LinkedIn']; // Voorbeeld apps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nieuwe Challenge Toevoegen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Challenge Inzet (Coins): ${_betCoins.toInt()}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Slider(
              value: _betCoins,
              min: 1,
              max: 3,
              divisions: 2, // 1, 2, 3
              label: _betCoins.toInt().toString(),
              onChanged: (double value) {
                setState(() {
                  _betCoins = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.secondary, // Blauwe kleur
              inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 30),
            Text(
              'Vrienden Toevoegen',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Zoek of voeg vrienden toe via e-mail/gebruikersnaam',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vriend toevoegen functionaliteit (Mock)')),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Apps voor deze Challenge',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0, // Ruimte tussen rijen
              children: _availableApps.map((app) {
                final isSelected = _selectedApps.contains(app);
                return FilterChip(
                  label: Text(app),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedApps.add(app);
                      } else {
                        _selectedApps.remove(app);
                      }
                    });
                  },
                  selectedColor: Theme.of(context).colorScheme.primary, // Geselecteerd in paars
                  checkmarkColor: Theme.of(context).colorScheme.onPrimary,
                  labelStyle: TextStyle(
                    color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedApps.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecteer minstens één app voor de challenge.')),
                    );
                    return;
                  }
                  // TODO: Challenge aanmaken logica (stuur data naar backend)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Challenge aangemaakt met inzet: ${_betCoins.toInt()} coins, Apps: ${_selectedApps.join(', ')}')),
                  );
                  Navigator.pop(context); // Ga terug naar vorig scherm
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Challenge Aanmaken'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}