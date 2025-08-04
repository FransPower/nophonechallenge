import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        'Je Huidige Coins',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '1250', // Dynamisch ophalen
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Icon(Icons.monetization_on_outlined, size: 60, color: Theme.of(context).colorScheme.primary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Koop coins logica via iDeal
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigeer naar iDeal betaling...')),
                  );
                },
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Coins Kopen (iDeal)'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Coins opnemen logica
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigeer naar opname opties...')),
                  );
                },
                icon: const Icon(Icons.remove_circle_outline),
                label: const Text('Coins Opnemen'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Recente Transacties',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Expanded( // Gebruik Expanded als je een lijst hebt in een Column
                child: ListView(
                  children: const [
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_upward, color: Colors.green),
                        title: Text('Ontvangen: 50 coins'),
                        subtitle: Text('Van Challenge A - 1 aug 2025'),
                        trailing: Text('+50', style: TextStyle(color: Colors.green)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_downward, color: Colors.red),
                        title: Text('Verloren: 20 coins'),
                        subtitle: Text('Aan Challenge B - 30 jul 2025'),
                        trailing: Text('-20', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.account_balance, color: Colors.blue),
                        title: Text('Gekocht: 1000 coins'),
                        subtitle: Text('Via iDeal - 25 jul 2025'),
                        trailing: Text('+1000', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}