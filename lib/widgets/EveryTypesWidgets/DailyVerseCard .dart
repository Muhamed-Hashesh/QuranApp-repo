import 'package:flutter/material.dart';
import 'CotentCardAyaToday.dart';

class DailyVerseCard extends StatelessWidget {
  final String arabicText;
  final String englishText;
  final String surahName;
  final int numJaz;
  final int numAyah;

  const DailyVerseCard({
    super.key,
    required this.arabicText,
    required this.englishText,
    required this.surahName,
    required this.numJaz,
    required this.numAyah,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContentCardAyaToday(
            arabicText: arabicText,
            englishText: englishText,
            surahName: surahName,
            numJaz: numJaz,
            numAyah: numAyah),
      ),
    );
  }
}