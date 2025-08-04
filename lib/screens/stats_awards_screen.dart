import 'package:flutter/material.dart';

class StatsAwardsScreen extends StatelessWidget {
  const StatsAwardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistieken & Awards'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overzicht Challenges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(context, 'Gewonnen', '15', Colors.green),
                    _buildStatItem(context, 'Verloren', '7', Colors.red),
                    _buildStatItem(context, 'Totaal', '22', Theme.of(context).colorScheme.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Jouw Awards',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 awards per rij
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8, // Breedte/hoogte verhouding
              ),
              itemCount: 6, // Aantal dummy awards
              itemBuilder: (context, index) {
                return _buildAwardItem(context, index);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Top Apps Challenges',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Card(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildAppStatItem(context, 'TikTok', '10 Challenges', Icons.tiktok),
                  _buildAppStatItem(context, 'Instagram', '8 Challenges', Icons.photo_camera),
                  _buildAppStatItem(context, 'YouTube', '5 Challenges', Icons.play_arrow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildAwardItem(BuildContext context, int index) {
    // Dummy data voor awards
    final List<Map<String, dynamic>> awards = [
      {'icon': Icons.star, 'color': Colors.amber, 'name': 'Eerste Challenge'},
      {'icon': Icons.emoji_events, 'color': Colors.teal, 'name': 'Social Detox Master'},
      {'icon': Icons.diamond, 'color': Colors.blueAccent, 'name': 'Coin Hoarder'},
      {'icon': Icons.verified, 'color': Colors.purple, 'name': 'Consistent Performer'},
      {'icon': Icons.local_fire_department, 'color': Colors.orange, 'name': 'Streak Bonus'},
      {'icon': Icons.rocket_launch, 'color': Colors.indigo, 'name': 'App Challenger'},
    ];

    final award = awards[index % awards.length]; // Gebruik modulo voor herhaling

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            award['icon'],
            size: 48,
            color: award['color'],
          ),
          const SizedBox(height: 8),
          Text(
            award['name'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppStatItem(BuildContext context, String appName, String challengeCount, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 30),
      title: Text(appName, style: Theme.of(context).textTheme.titleMedium),
      trailing: Text(challengeCount, style: Theme.of(context).textTheme.bodyLarge),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Details van $appName challenges')),
        );
      },
    );
  }
}