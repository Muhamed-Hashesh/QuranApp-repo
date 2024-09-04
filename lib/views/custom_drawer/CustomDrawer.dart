import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';

import 'widgets/CustomCard.dart';
import 'widgets/CustomTabBar.dart';
import 'widgets/FavoriteTab.dart';
import 'widgets/SettingsTab.dart';

class CustomDrawer extends StatelessWidget {
  final tabs = [' الإعدادات', 'المفضلة'];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomCard(),
          ),
          10.height,
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  CustomTabBar(tabs: tabs),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SettingsTab(),
                        FavoriteTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
