import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/widgets/daily_column_widget.dart';
import 'package:quran/views/every_types_screen/widgets/prayer_time_card.dart';
import 'package:quran/views/every_types_screen/widgets/tab_bar_widget.dart';
import 'package:quran/widgets/custom_appbar.dart';
import '../../custom_drawer/pages/custom_drawer.dart';

class EveryTypesView extends StatelessWidget {
  const EveryTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(
            title: 'القرآن الكريم', centerTitle: false, searchBar: true),
        drawer: CustomDrawer(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              PrayerTimeCard(
                imageUrl: 'assets/images/open_book.jpg',
              ),
              DailyColumnWidget(
                arabicText: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                englishText:
                    'All praise and thanks be to the Lord of the worlds.',
                surahName: "الفاتحة",
                numJaz: 1,
                numAyah: 1,
              ),
              SizedBox(height: 10),
              QuranAppTabBarGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
