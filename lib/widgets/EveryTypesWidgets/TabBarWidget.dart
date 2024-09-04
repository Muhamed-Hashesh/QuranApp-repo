import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'GridViewItems.dart';

class QuranAppTabBarGrid extends StatefulWidget {
  const QuranAppTabBarGrid({super.key});

  @override
  QuranAppTabBarGridState createState() => QuranAppTabBarGridState();
}

class QuranAppTabBarGridState extends State<QuranAppTabBarGrid>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['جميع التصنيفات', 'كل الوسائط', 'أوقات الصلاة'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildCustomTabBar(), 8.height, Gridviewitems()],
    );
  }

  Widget _buildCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          labelColor: Theme.of(context).colorScheme.secondary,
          unselectedLabelColor: Theme.of(context).colorScheme.secondary,
          labelPadding: const EdgeInsets.all(5),
          tabs: tabs.map((String name) {
            return Tab(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
