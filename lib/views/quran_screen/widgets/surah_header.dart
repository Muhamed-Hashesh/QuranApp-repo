import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class ChapterHeader extends StatelessWidget {
  const ChapterHeader({
    super.key,
    required this.surahNumber,
  });

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/sharing_chapter_header.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Center(
        child: Text(
          'سورة ${quran.getSurahNameArabic(surahNumber)}',
          style: TextStyle(
            fontFamily: 'UthmanicHafs',
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
