import 'package:flutter/material.dart';
import 'package:quran/widgets/CustomAppBar.dart';
import '../widgets/DailyVerseCard .dart';
import '../widgets/PrayerTimeCard .dart';

class Everytypesview extends StatelessWidget {
  const Everytypesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const Customappbar(),
          drawer: const Drawer(),
          body: Column(
            children: [
              const PrayerTimeCard(),
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
                      'سورة الفاتحة',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              const DailyVerseCard(
                arabicText: 'الحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                englishText:
                    'All praise and thanks be to the Lord of the worlds.',
                surahName: "الفاتحة",
                numJaz: 1,
                numAyah: 1,
              ),
            ],
          )),
    );
  }
}
