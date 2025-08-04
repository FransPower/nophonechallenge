import 'package:flutter/material.dart';
import 'package:nophonechallenge/screens/add_challenge_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  // Voorbeeld data
  final List<Map<String, String>> _newChallenges = [
    {'title': 'Social Media Detox (1 dag)', 'description': 'Blijf 24 uur van X app af!'},
    {'title': 'Productiviteits Boost', 'description': 'Gebruik Y app max 1 uur per dag voor 3 dagen.'},
  ];
  final List<Map<String, String>> _ongoingChallenges = [
    {'title': 'TikTok Timer (lopend)', 'description': 'Je hebt nog 2 dagen over!'},
    {'title': 'Instagram Break', 'description': 'Nog 5 dagen te gaan.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nieuwe Challenges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _newChallenges.isEmpty
                ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Geen nieuwe challenges beschikbaar. Creëer er zelf één!'),
            )
                : ListView.builder(
              shrinkWrap: true, // Belangrijk voor geneste listviews in SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(), // Voorkom dubbel scrollen
              itemCount: _newChallenges.length,
              itemBuilder: (context, index) {
                return ChallengeCard(
                  title: _newChallenges[index]['title']!,
                  description: _newChallenges[index]['description']!,
                  buttonText: 'Accepteer',
                  onButtonPressed: () {
                    // TODO: Accepteer challenge logica
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Challenge "${_newChallenges[index]['title']}" geaccepteerd!')),
                    );
                    // Misschien de challenge verplaatsen van _newChallenges naar _ongoingChallenges
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Lopende Challenges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _ongoingChallenges.isEmpty
                ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Je hebt momenteel geen lopende challenges.'),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _ongoingChallenges.length,
              itemBuilder: (context, index) {
                return ChallengeCard(
                  title: _ongoingChallenges[index]['title']!,
                  description: _ongoingChallenges[index]['description']!,
                  buttonText: 'Bekijk voortgang',
                  onButtonPressed: () {
                    // TODO: Bekijk voortgang logica
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Voortgang van "${_ongoingChallenges[index]['title']}" bekijken')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigeer naar het scherm om een nieuwe challenge toe te voegen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddChallengeScreen()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary, // Gebruik primaire kleur
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // Tekstkleur op FAB
        tooltip: 'Nieuwe Challenge Toevoegen',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ChallengeCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}