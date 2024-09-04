import 'package:flutter/material.dart';

import 'daily_verse_card .dart';

class DailyColumnWidget extends StatelessWidget {
  const DailyColumnWidget(
      {super.key,
      required this.arabicText,
      required this.englishText,
      required this.surahName,
      required this.numJaz,
      required this.numAyah});

  final String arabicText;
  final String englishText;
  final String surahName;
  final int numJaz;
  final int numAyah;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'آية اليوم',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                'سورة $surahName',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        DailyVerseCard(
          arabicText: arabicText,
          englishText: englishText,
          surahName: surahName,
          numJaz: numJaz,
          numAyah: numAyah,
        ),
      ],
    );
  }
}
