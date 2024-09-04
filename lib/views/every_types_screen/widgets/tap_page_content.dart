import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/widgets/grid_view_items.dart';

class TapPageContent extends StatelessWidget {
  const TapPageContent({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
        controller: _tabController,
        children: [
          Gridviewitems(),
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
        ],
      ),
    );
  }
}
