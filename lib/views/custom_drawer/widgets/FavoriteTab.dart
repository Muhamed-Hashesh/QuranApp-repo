import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteTab extends StatelessWidget {
  final List<Map<String, String>> verses = [
    {
      'arabic': 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      'translation': 'سورة الفاتحة: 1',
    },
    {
      'arabic':
          'إِنَّ الَّذِينَ يَأْكُلُونَ أَمْوَٰلَ الْيَتَـٰمَىٰ ظُلْمًا إِنَّمَا يَأْكُلُونَ فِى بُطُونِهِمْ نَارًۭا ۖ وَسَيَصْلَوْنَ سَعِيرًۭا',
      'translation': 'سورة البقرة: 188',
    },
    {
      'arabic': 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      'translation': 'سورة الفاتحة: 1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: verses.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color(0xffF0E6D2),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // Use Expanded to allow text to wrap properly
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        verses[index]['arabic']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'AlNile',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        verses[index]['translation']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffCC9B76),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Iconsax.heart_remove,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
