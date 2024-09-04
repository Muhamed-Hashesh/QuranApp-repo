import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/widgets/presestent_header.dart';

class ThreeTabsContainer extends StatelessWidget {
  const ThreeTabsContainer({
    super.key,
    required TabController tabController,
    required this.tabs,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeader(
        widget: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(13),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSecondaryContainer,
            labelPadding: const EdgeInsets.all(0),
            tabs: [
              for (var i = 0; i < tabs.length; i++)
                Tab(
                  child: Text(
                    tabs[i],
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
