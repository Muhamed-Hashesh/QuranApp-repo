import 'package:flutter/material.dart';
import 'package:quran/widgets/CustomAppBar.dart';
import 'package:quran/widgets/EveryTypesWidgets/DailyColumnWidget.dart';
import '../widgets/EveryTypesWidgets/PrayerTimeCard .dart';
import '../widgets/EveryTypesWidgets/TabBarWidget.dart';

class Everytypesview extends StatelessWidget {
  const Everytypesview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: Customappbar(),
          drawer: Drawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                PrayerTimeCard(
                  imageUrl: 'assets/images/open_book.jpg',
                ),
                DailyColumnWidget(
                  arabicText: 'الحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                  englishText:
                      'All praise and thanks be to the Lord of the worlds.',
                  surahName: "الفاتحة",
                  numJaz: 1,
                  numAyah: 1,
                ),
                SizedBox(height: 10),
                QuranAppTabBarGrid()
              ],
            ),
          )),
    );
  }
}
