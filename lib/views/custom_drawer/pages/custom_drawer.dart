import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/custom_drawer/widgets/CustomCard.dart';
import 'package:quran/views/custom_drawer/widgets/CustomTabBar.dart';
import 'package:quran/views/custom_drawer/widgets/FavoriteTab.dart';
import 'package:quran/views/custom_drawer/widgets/SettingsTab.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final tabs = [' الإعدادات', 'المفضلة'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
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
