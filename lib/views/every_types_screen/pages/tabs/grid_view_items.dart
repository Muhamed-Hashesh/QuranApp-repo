import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';

class Gridviewitems extends StatelessWidget {
  const Gridviewitems({super.key});
  static final List<Map<String, String>> gridItems = [
    {'icon': 'assets/images/image 12.png', 'label': 'الأدعية'},
    {'icon': 'assets/images/image 8.png', 'label': 'السبحة الالكترونية'},
    {'icon': 'assets/images/image 17.png', 'label': 'أسماء الله الحسني'},
    {'icon': 'assets/images/image 16.png', 'label': 'القرآن'},
    {'icon': 'assets/images/image 7.png', 'label': 'الأذكار'},
    {'icon': 'assets/images/image 10.png', 'label': 'الأحاديث'},
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
          );
        },
      ),
    );
  }
}
