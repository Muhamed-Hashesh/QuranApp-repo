import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'grid_view_items.dart';

class QuranAppTabBarGrid extends StatefulWidget {
  const QuranAppTabBarGrid({super.key});

  @override
  QuranAppTabBarGridState createState() => QuranAppTabBarGridState();
}

class QuranAppTabBarGridState extends State<QuranAppTabBarGrid> {
  late TabController _tabController;
  final List<String> tabs = ['جميع التصنيفات', 'كل الوسائط', 'أوقات الصلاة'];

  @override
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                ]),
          ),
          Expanded(
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
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                // Gridviewitems(),
                // Gridviewitems(),
                // Gridviewitems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
