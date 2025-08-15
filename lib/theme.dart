import 'package:flutter/material.dart';

// Catppuccin Frappe geïnspireerde kleuren
const Color catppuccinMauve = Color(0xFFCA9EE6); // Paarsachtig
const Color catppuccinSapphire = Color(0xFF85C1DC); // Blauwachtig
const Color catppuccinBase = Color(0xFF303446); // Donkere achtergrond
const Color catppuccinText = Color(0xFFC6D0F5); // Lichte tekst
const Color catppuccinSurface0 = Color(0xFF414559); // Iets lichtere oppervlakken
const Color catppuccinSurface1 = Color(0xFF51576D); // Nog iets lichtere oppervlakken
const Color catppuccinSurface2 = Color(0xFF626880); // Nog iets lichtere oppervlakken
const Color catppuccinPink = Color(0xFFF4B8E4); // Een vleugje roze voor accenten

ThemeData appTheme() {
  return ThemeData(
    // Gebruik de Catppuccin basis als achtergrond
    scaffoldBackgroundColor: catppuccinBase,
    // Kleuren voor de hele ColorScheme
    colorScheme: const ColorScheme.dark(
      primary: catppuccinMauve, // Primaire kleur (bijv. knoppen, actieve items)
      secondary: catppuccinSapphire, // Secundaire kleur (bijv. accenten)
      surface: catppuccinSurface0, // Kleur voor Cards, Dialogs etc.
      surfaceContainerHighest: catppuccinSurface1,
      error: Colors.redAccent, // Foutkleur
      onPrimary: catppuccinText, // Tekst op primaire kleur
      onSecondary: catppuccinText, // Tekst op secundaire kleur
      onSurface: catppuccinText, // Tekst op achtergrond
      onError: Colors.white, // Tekst op foutkleur
      brightness: Brightness.dark, // Algemene helderheid
    ),
    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: catppuccinBase, // Dezelfde kleur als de achtergrond
      foregroundColor: catppuccinText, // Tekstkleur voor de titel
      elevation: 0, // Geen schaduw voor een minimalistisch effect
      centerTitle: true, // Titel centreren
    ),
    // Tekst styling
    textTheme: const TextTheme(
      // Pas de kleuren van de standaardtekststijlen aan
      bodyLarge: TextStyle(color: catppuccinText),
      bodyMedium: TextStyle(color: catppuccinText),
      displayLarge: TextStyle(color: catppuccinText),
      displayMedium: TextStyle(color: catppuccinText),
      displaySmall: TextStyle(color: catppuccinText),
      headlineLarge: TextStyle(color: catppuccinText),
      headlineMedium: TextStyle(color: catppuccinText),
      headlineSmall: TextStyle(color: catppuccinText),
      titleLarge: TextStyle(color: catppuccinText),
      titleMedium: TextStyle(color: catppuccinText),
      titleSmall: TextStyle(color: catppuccinText),
      labelLarge: TextStyle(color: catppuccinText),
      labelMedium: TextStyle(color: catppuccinText),
      labelSmall: TextStyle(color: catppuccinText),
    ),
    // Knoppen styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: catppuccinMauve, // Knoppen in primaire kleur
        foregroundColor: catppuccinText, // Tekst op knoppen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Afgeronde hoeken
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    // Input velden styling
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: catppuccinSurface0, // Achtergrondkleur voor inputvelden
      labelStyle: const TextStyle(color: catppuccinText),
      hintStyle: TextStyle(color: catppuccinText.withOpacity(0.7)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none, // Geen zichtbare rand
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: catppuccinSapphire, width: 2), // Focusrand in blauw
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    // BottomNavigationBar styling
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: catppuccinSurface0, // Iets lichtere achtergrond
      selectedItemColor: catppuccinMauve, // Geselecteerd item in paars
      unselectedItemColor: catppuccinText, // Ongeselecteerd in tekstkleur
      type: BottomNavigationBarType.fixed, // Alle items zichtbaar
      elevation: 0, // Geen schaduw
      showUnselectedLabels: true, // Labels voor alle items (als je dat wilt)
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    // Card styling
    cardTheme: CardTheme(
      color: catppuccinSurface0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    ),
    // Slider styling
    sliderTheme: SliderThemeData(
      activeTrackColor: catppuccinSapphire,
      inactiveTrackColor: catppuccinSurface1,
      thumbColor: catppuccinMauve,
      overlayColor: catppuccinMauve.withOpacity(0.2),
      valueIndicatorColor: catppuccinMauve,
      valueIndicatorTextStyle: const TextStyle(color: catppuccinText),
    ),
    // Chip styling (voor Add Challenge screen)
    chipTheme: const ChipThemeData(
      backgroundColor: catppuccinSurface0,
      selectedColor: catppuccinMauve,
      labelStyle: TextStyle(color: catppuccinText),
      secondaryLabelStyle: TextStyle(color: catppuccinText),
      checkmarkColor: catppuccinText,
    ),
  );
}