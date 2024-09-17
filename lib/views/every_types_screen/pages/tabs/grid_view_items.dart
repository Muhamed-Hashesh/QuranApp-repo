import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/ahadith_screen/presentation/views/ahadith_page.dart';
import 'package:quran_project/views/al_ad3ya_screen/pages/ad3ya_page.dart';
import 'package:quran_project/views/azkar_screen/pages/azkar_page.dart';
import 'package:quran_project/views/quran_screen/pages/surah_details_screen.dart';
import 'package:quran_project/views/sebha_screen/pages/sebhs_page.dart';

class Gridviewitems extends StatelessWidget {
  const Gridviewitems({super.key});
  static final List<Map<String, dynamic>> gridItems = [
    {
      'icon': 'assets/images/image 12.png',
      'label': 'الأدعية',
      'nav': const AlAd3yaScreen()
    },
    {
      'icon': 'assets/images/image 8.png',
      'label': 'السبحة الالكترونية',
      'nav': const TasbihView()
    },
    {
      'icon': 'assets/images/image 17.png',
      'label': 'أسماء الله الحسني',
      'nav': null
    },
    {
      'icon': 'assets/images/image 16.png',
      'label': 'القرآن',
      'nav': const SurahDetailScreen(surahNumber: 1)
    },
    {
      'icon': 'assets/images/image 7.png',
      'label': 'الأذكار',
      'nav': const AzkarPage()
    },
    {
      'icon': 'assets/images/image 10.png',
      'label': 'الأحاديث',
      'nav': const AhadithPage()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(gridItems[index]['nav']!),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(gridItems[index]['icon']!),
                  // Text(
                  //   gridItems[index]['icon']!,
                  //   style: const TextStyle(fontSize: 32),
                  // ),
                  8.height,
                  Text(
                    gridItems[index]['label']!,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
