import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/sized_box.dart';

class ContentCardAyaToday extends StatelessWidget {
  const ContentCardAyaToday({
    super.key,
    required this.arabicText,
    required this.englishText,
    required this.surahName,
    required this.numJaz,
    required this.numAyah,
  });

  final String arabicText;
  final String englishText;
  final String surahName;
  final int numJaz;
  final int numAyah;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              arabicText,
              style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).colorScheme.secondary,
                fontFamily: 'AlNile',
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconsaxPlusBold.heart_add,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 45,
                ))
          ],
        ),
        Text(
          textDirection: TextDirection.ltr,
          englishText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        5.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'سورة $surahName : الجزء $numJaz - أية $numAyah',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
