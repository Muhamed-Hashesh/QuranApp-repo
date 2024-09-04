import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/pages/tabs/all_media_tap_content.dart';
import 'package:quran/views/every_types_screen/pages/tabs/grid_view_items.dart';

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
          const AllMediaTapContent(),
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
