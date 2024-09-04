import 'package:flutter/material.dart';
import 'content_card_aya_today.dart';

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
    return Container(
      decoration: BoxDecoration(
        border: const Border(
          left: BorderSide(
            color: Color(0xffFFB57D),
            width: 5.0,
          ),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ContentCardAyaToday(
              arabicText: arabicText,
              englishText: englishText,
              surahName: surahName,
              numJaz: numJaz,
              numAyah: numAyah),
        ),
      ),
    );
  }
}
