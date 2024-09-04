import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/themes/colors.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(arabicText,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: LightColors.instance.kAyahTodayFontColor,
                    )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconsaxPlusBold.heart_add,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(0.5),
                  size: 28,
                ))
          ],
        ),
        Text(
            textDirection: TextDirection.ltr,
            englishText,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            )),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'سورة $surahName : الجزء $numJaz - أية $numAyah',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: LightColors.instance.kAyahTodayFontColor,
                  fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
