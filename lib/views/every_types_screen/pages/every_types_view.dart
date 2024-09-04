import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/widgets/daily_column_widget.dart';
import 'package:quran/views/every_types_screen/widgets/grid_view_items.dart';
import 'package:quran/views/every_types_screen/widgets/prayer_time_card.dart';
import 'package:quran/views/every_types_screen/widgets/tab_bar_widget.dart';
import 'package:quran/widgets/custom_appbar.dart';
import '../../custom_drawer/pages/custom_drawer.dart';

class EveryTypesView extends StatefulWidget {
  const EveryTypesView({super.key});

  @override
  State<EveryTypesView> createState() => _EveryTypesViewState();
}

class _EveryTypesViewState extends State<EveryTypesView>
    with TickerProviderStateMixin {
  final List<String> tabs = ['جميع التصنيفات', 'كل الوسائط', 'أوقات الصلاة'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Properly dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(
            title: 'القرآن الكريم', centerTitle: false, searchBar: true),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                PrayerTimeCard(
                  imageUrl: 'assets/images/open_book.jpg',
                ),
                DailyColumnWidget(
                  arabicText: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                  englishText:
                      'All praise and thanks be to the Lord of the worlds.',
                  surahName: "الفاتحة",
                  numJaz: 1,
                  numAyah: 1,
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerHeight: 0,
                      indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      // labelColor: Theme.of(context).colorScheme.onSurface,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSecondaryContainer,
                      labelPadding: const EdgeInsets.all(2),
                      tabs: [
                        for (var i = 0; i < tabs.length; i++)
                          Tab(
                            child: Text(
                              tabs[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                            ),
                          ),
                      ]),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200, // Adjust height based on your content
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        width: 200,
                        height: 100,
                        color: Colors.red,
                      ),
                      Container(
                        width: 200,
                        height: 100,
                        color: Colors.blue,
                      ),
                      Gridviewitems(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
