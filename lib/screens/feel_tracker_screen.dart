import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // BELANGRIJK: Deze import moet hier staan!

class FeelTrackerScreen extends StatefulWidget {
  const FeelTrackerScreen({super.key});

  @override
  State<FeelTrackerScreen> createState() => _FeelTrackerScreenState();
}

class _FeelTrackerScreenState extends State<FeelTrackerScreen> {
  final Map<String, double> _answers = {
    'Hoe voel je je vandaag?': 3.0,
    'Hoeveel energie heb je?': 3.0,
    'Hoe productief was je?': 3.0,
    'Hoeveel sociale interactie had je?': 3.0,
    'Hoe tevreden ben je met je social media gebruik?': 3.0,
  };

  // Dummy data voor de grafiek (real-world zou dit van een database komen)
  // [x-as: dag, y-as: score mentale gesteldheid (1-5), y-as: social media gebruik (0-100)]
  final List<FlSpot> _mentalStateSpots = const [
    FlSpot(0, 3), FlSpot(1, 2), FlSpot(2, 4), FlSpot(3, 3), FlSpot(4, 5), FlSpot(5, 4), FlSpot(6, 3)
  ];
  final List<FlSpot> _socialMediaUsageSpots = const [
    FlSpot(0, 50), FlSpot(1, 80), FlSpot(2, 30), FlSpot(3, 60), FlSpot(4, 20), FlSpot(5, 40), FlSpot(6, 70)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feel Tracker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mentale Gesteldheid Questionnaire',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            // Vragenlijst met Likertschaal
            ..._answers.keys.map((question) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Slider(
                      value: _answers[question]!,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: _answers[question]!.toInt().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _answers[question] = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('1 (Slecht)'),
                        Text('5 (Geweldig)'),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 40),
            Text(
              'Social Media Gebruik vs. Mentale Gesteldheid',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            // Grafiek sectie
            AspectRatio(
              aspectRatio: 1.7, // Breedte/hoogte verhouding
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          strokeWidth: 1,
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              // Weekdagen labels voor de x-as
                              switch (value.toInt()) {
                                case 0: return const Text('Ma');
                                case 1: return const Text('Di');
                                case 2: return const Text('Wo');
                                case 3: return const Text('Do');
                                case 4: return const Text('Vr');
                                case 5: return const Text('Za');
                                case 6: return const Text('Zo');
                                default: return const Text('');
                              }
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              // Labels voor de y-as (Mentale Gesteldheid)
                              switch (value.toInt()) {
                                case 1: return const Text('Slecht');
                                case 3: return const Text('Neutraal');
                                case 5: return const Text('Geweldig');
                                default: return const Text('');
                              }
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Theme.of(context).colorScheme.surfaceVariant, width: 1),
                      ),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 100, // Max voor social media gebruik
                      lineBarsData: [
                        LineChartBarData(
                          spots: _mentalStateSpots.map((spot) => FlSpot(spot.x, spot.y * 20)).toList(), // Schaal 1-5 naar 20-100 voor visualisatie
                          isCurved: true,
                          color: Theme.of(context).colorScheme.primary, // Paars voor mentale gesteldheid
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: _socialMediaUsageSpots,
                          isCurved: true,
                          color: Theme.of(context).colorScheme.secondary, // Blauw voor social media gebruik
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      // Tooltips voor als je op een punt tikt
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (LineBarSpot touchedSpot) { // <-- Belangrijke correctie hier: Type is LineBarSpot
                            return Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.9);
                          },
                          getTooltipItems: (List<LineBarSpot> touchedSpots) { // <-- Belangrijke correctie hier: Type is LineBarSpot
                            return touchedSpots.map((LineBarSpot spot) { // <-- Explicitly cast spot to LineBarSpot
                              if (spot.bar.color == Theme.of(context).colorScheme.primary) { // <-- Nu is spot.bar.color geldig
                                return LineTooltipItem(
                                  'Gevoel: ${(spot.y / 20).toStringAsFixed(1)}', // Rescale back to 1-5
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
                                );
                              } else {
                                return LineTooltipItem(
                                  'SM Gebruik: ${spot.y.toStringAsFixed(0)}%',
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
                                );
                              }
                            }).toList();
                          },
                        ),
                        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {}, // Empty for now
                        handleBuiltInTouches: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 20, height: 10, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('Mentale Gesteldheid', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 20),
                Container(width: 20, height: 10, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 8),
                Text('Social Media Gebruik', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Antwoorden opslaan logica
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Antwoorden opgeslagen!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Opslaan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}