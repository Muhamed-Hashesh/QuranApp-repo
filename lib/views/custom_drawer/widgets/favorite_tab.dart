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
      padding: const EdgeInsets.only(top: 2),
      itemCount: verses.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      verses[index]['arabic']!,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.right,
                      softWrap: true,
                    ),
                    // const SizedBox(height: 8),
                    Text(
                      verses[index]['translation']!,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
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
        );
      },
    );
  }
}
