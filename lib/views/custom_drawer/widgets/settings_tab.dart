import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_project/views/custom_drawer/widgets/settings_item.dart';
import 'package:quran_project/views/every_types_screen/pages/every_types_view.dart';
import 'package:quran_project/views/quran_screen/pages/surah_details_screen.dart';

class SettingsTab extends StatelessWidget {
  List<Map<String, dynamic>> settingsList = [
    {
      'icon': Image.asset(
        'assets/images/Quraan.png',
        width: 35,
      ),
      'label': 'القرآن الكريم',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.icon),
      'label': 'الأحزاب',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.icon),
      'label': 'التفسير',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.icon),
      'label': 'الأجزاء',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.book),
      'label': 'السجدات',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.icon),
      'label': 'الركوع',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.home),
      'label': 'الصفحة الرئيسية',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.moon),
      'label': 'تفعيل الوضع الليلي',
      'hasSwitch': true,
    },
    {
      'icon': const Icon(Iconsax.emoji_happy),
      'label': 'المزيد من التطبيقات',
      'hasSwitch': false,
    },
    {
      'icon': const Icon(Iconsax.share),
      'label': 'مشاركة التطبيق',
      'hasSwitch': false,
    },
  ];

  SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => SettingsItem(
        index: index,
        settingsList: settingsList,
      ),
      itemCount: settingsList.length,
    );
  }
}
