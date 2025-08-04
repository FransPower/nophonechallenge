import 'package:flutter/material.dart';
import 'package:nophonechallenge/theme.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/login_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/profile_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/wallet_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/challenges_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/stats_awards_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/feel_tracker_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam
import 'package:nophonechallenge/screens/about_screen.dart'; // <--- Pas 'nophonechallenge' aan naar je projectnaam


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoPhone Challenge', // Pas de titel aan
      theme: appTheme(), // Gebruik je aangepaste thema
      home: const LoginScreen(), // Start met het login scherm
      debugShowCheckedModeBanner: false, // Verberg de debug banner
      routes: {
        '/main': (context) => const MainScreen(), // Route naar de hoofdnavigatie na login
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index van het geselecteerde tabblad

  static final List<Widget> _widgetOptions = <Widget>[
    const ProfileScreen(),
    const WalletScreen(),
    const ChallengesScreen(),
    const StatsAwardsScreen(),
    const FeelTrackerScreen(),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profiel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood_outlined),
            label: 'Feel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}