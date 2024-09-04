import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الآيات اليومية',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Text('سورة $surahName',
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        8.height,
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
