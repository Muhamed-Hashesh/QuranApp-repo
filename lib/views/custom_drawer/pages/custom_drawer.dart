import 'package:flutter/material.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/custom_drawer/widgets/custom_card.dart';
import 'package:quran_project/views/custom_drawer/widgets/custom_tab_bar.dart';
import 'package:quran_project/views/custom_drawer/widgets/favorite_tab.dart';
import 'package:quran_project/views/custom_drawer/widgets/settings_tab.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final tabs = [' الإعدادات', 'المفضلة'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            children: [
              8.height,
              CustomCard(),
              24.height,
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const CustomTabBar(),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SettingsTab(),
                            const FavoriteTab(),
                          ],
                        ),
                      ),
                    ],
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
