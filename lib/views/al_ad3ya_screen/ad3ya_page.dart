import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/helpers/sized_box.dart';

class AlAd3yaScreen extends StatelessWidget {
  const AlAd3yaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الأدعية',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
            // padding: EdgeInsets.symmetric(horizontal: 24),
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Iconsax.menu,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal_1),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: SvgPicture.asset(
            //     'assets/icons/vuesax/outline/search-normal.svg',
            //     color: Theme.of(context).colorScheme.primary,
            //   ),
            // ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'أدعية الرحمة',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '٣ أدعية',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'اللهمَّ مالِكَ المُلْكِ تُؤْتي المُلْكَ مَن تشاءُ وتنزِعُ المُلْكَ ممَّن تشاءُ وتُعِزُّ مَن تشاءُ وتُذِلُّ مَن تشاءُ بيدِك الخيرُ إنَّك على كلِّ شيءٍ قديرٌ، رحمنَ الدُّنيا والآخرةِ تُعْطيهما مَن تشاءُ وتمنَعُ منهما مَن تشاءُ ارحَمْني رحمةً تُغْنيني بها عن رحمةِ مَن سِواك',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) =>
                            20.height,
                      ),
                    ),
                  ],
                ),
                itemCount: 20,
              ),
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  20,
                  (index) => AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    duration: const Duration(milliseconds: 300),
                    width: 7,
                    height: 7,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
