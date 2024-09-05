import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';

class Gridviewitems extends StatelessWidget {
  const Gridviewitems({super.key});
  static final List<Map<String, String>> gridItems = [
    {'icon': '🕋', 'label': 'أسماء الله'},
    {'icon': '📿', 'label': 'التسبيح'},
    {'icon': '🤲', 'label': 'الدعاء'},
    {'icon': '📖', 'label': 'الأحاديث'},
    {'icon': '🧎', 'label': 'الذكر'},
    {'icon': '📜', 'label': 'القرآن'},
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
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gridItems[index]['icon']!,
                  style: const TextStyle(fontSize: 32),
                ),
                8.height,
                Text(
                  gridItems[index]['label']!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
