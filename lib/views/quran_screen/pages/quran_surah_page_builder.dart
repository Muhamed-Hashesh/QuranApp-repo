import 'package:flutter/material.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/views/quran_screen/widgets/surah_header.dart';
import 'package:quran/quran.dart' as quran;

class QuranSurahPageBuilder extends StatelessWidget {
  const QuranSurahPageBuilder({
    super.key,
    required this.pages,
    required this.versesByPage,
    required this.surahNumber,
  });

  final List<int> pages;
  final Map<int, List<int>> versesByPage;
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final pageNumber = pages[index];
        final verses = versesByPage[pageNumber] ?? [];
        final isFirstPage = index == 0;

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                24.height,
                if (isFirstPage)
                  Column(
                    children: [
                      ChapterHeader(surahNumber: surahNumber),
                      24.height,
                      surahNumber != 9 && surahNumber != 1
                          ? const Image(
                              image: AssetImage('assets/images/basmala.png'),
                              width: 250,
                            )
                          : const SizedBox(),
                    ],
                  ),
                // if (surahNumber != 9) ChapterHeader(surahNumber: surahNumber),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontSize: 23,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    children: [
                      ...verses.map((verseNumber) {
                        final verseText =
                            quran.getVerse(surahNumber, verseNumber);
                        final verseNumberArabic =
                            convertToArabicNumerals(verseNumber.toString());
                        return TextSpan(
                          text: '$verseText $verseNumberArabic ',
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
