import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/helpers/sized_box.dart';

class AlAd3yaScreen extends StatefulWidget {
  const AlAd3yaScreen({super.key});

  @override
  State<AlAd3yaScreen> createState() => _AlAd3yaScreenState();
}

class _AlAd3yaScreenState extends State<AlAd3yaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'الأدعية',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
            // padding: EdgeInsets.symmetric(horizontal: 24),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
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
          ],
        ),
        drawer: const Drawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    'اللهمَّ مالِكَ المُلْكِ تُؤْتي المُلْكَ مَن تشاءُ وتنزِعُ المُلْكَ ممَّن تشاءُ وتُعِزُّ مَن تشاءُ وتُذِلُّ مَن تشاءُ بيدِك الخيرُ إنَّك على كلِّ شيءٍ قديرٌ، رحمنَ الدُّنيا والآخرةِ تُعْطيهما مَن تشاءُ وتمنَعُ منهما مَن تشاءُ ارحَمْني رحمةً تُغْنيني بها عن رحمةِ مَن سِواك',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                                16.height,
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 20,
              ),
            ),
            // The AnimatedContainer is placed outside of PageView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  20,
                  (index) => AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: pageIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    duration: const Duration(milliseconds: 300),
                    width: pageIndex == index ? 18 : 7,
                    height: 7,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
