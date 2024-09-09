import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/widgets/custom_appbar.dart';

class SurahListScreen extends StatelessWidget {
  const SurahListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          notTitle: true,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سورة البقرة',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'الجزء الأول - ٤/١ الحزب ٢',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        body: ListView.separated(
          itemCount: quran.totalSurahCount,
          itemBuilder: (context, index) {
            final surahNumber = index + 1;
            return ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    convertToArabicNumerals(surahNumber.toString()),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              title: Text(
                quran.getSurahNameArabic(surahNumber),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              subtitle: Text(
                'آياتها ${convertToArabicNumerals(quran.getVerseCount(surahNumber).toString())} - ${quran.getPlaceOfRevelation(surahNumber) == 'Madinah' ? 'مدنية' : 'مكية'}',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              trailing: Text(
                'الصفحة ${convertToArabicNumerals(quran.getPageNumber(surahNumber, 1).toString())}',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SurahDetailScreen(surahNumber: surahNumber),
                  ),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => 16.height,
        ),
      ),
    );
  }
}

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
  });

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          searchBar: true,
          notTitle: true,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سورة البقرة',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'الجزء الأول - ٤/١ الحزب ٢',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        body: PageView.builder(
          itemCount: quran.totalPagesCount,
          itemBuilder: (context, pageIndex) {
            final pageData = quran.getPageData(pageIndex + 1);
            final verses = <Widget>[];

            for (var data in pageData) {
              final startVerse = data['start'];
              final endVerse = data['end'];

              for (var verseNumber = startVerse;
                  verseNumber <= endVerse;
                  verseNumber++) {
                final verseText = quran.getVerse(pageIndex + 1, verseNumber);
                verses.add(
                  Text(
                    '$verseText ${convertToArabicNumerals(verseNumber.toString())}',
                    style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                );
              }
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: verses,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
