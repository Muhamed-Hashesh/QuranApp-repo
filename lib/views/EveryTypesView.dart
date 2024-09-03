import 'package:flutter/material.dart';
import 'package:quran/widgets/CustomAppBar.dart';
import 'package:quran/widgets/DailyColumnWidget.dart';
import '../widgets/PrayerTimeCard .dart';
import '../widgets/TabBarWidget.dart';

class Everytypesview extends StatelessWidget {
  const Everytypesview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: Customappbar(),
            drawer: Drawer(),
            body: Column(
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
                TabBar(
                  tabs: [
                    Tab(
                      text: "الصفحة الرئيسية",
                    ),
                    Tab(
                      text: "الصفحة 2",
                    ),
                    Tab(
                      text: "الصفحة 3",
                    )
                  ],
                ),
                TabBarWidget()
              ],
            )),
      ),
    );
  }
}
