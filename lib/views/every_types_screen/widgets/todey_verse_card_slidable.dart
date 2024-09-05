import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/every_types_screen/pages/every_types_view.dart';
import 'package:quran/views/every_types_screen/widgets/today_verse_card_page_view_content.dart';

class TodeyVerseCardSlidable extends StatefulWidget {
  const TodeyVerseCardSlidable({
    super.key,
  });

  @override
  State<TodeyVerseCardSlidable> createState() => _TodeyVerseCardSlidableState();
}

class _TodeyVerseCardSlidableState extends State<TodeyVerseCardSlidable> {
  int dotsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الآيات اليومية',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                'سورة الفاتحة',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        8.height,
        SizedBox(
          height: 200,
          child: PageView.builder(
            reverse: true,
            onPageChanged: (value) {
              setState(() {
                dotsIndex = value;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) =>
                TodayVerseCardPageViewContent(index: index),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                int reverseIndex = 2 - index;
                return AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: dotsIndex == reverseIndex
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  duration: const Duration(milliseconds: 300),
                  width: dotsIndex == reverseIndex ? 18 : 7,
                  height: 7,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
