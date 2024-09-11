import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_project/views/custom_drawer/widgets/settings_item.dart';

class SettingsTab extends StatelessWidget {
  static List<Map<String, dynamic>> settingsList = [
    {
      'icon': Image.asset(
        'assets/images/Quraan.png',
        width: 35,
      ),
      'label': 'القرآن الكريم',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.icon),
      'label': 'الأحزاب',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.icon),
      'label': 'التفسير',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.icon),
      'label': 'الأجزاء',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.book),
      'label': 'السجدات',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.icon),
      'label': 'الركوع',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.home),
      'label': 'الصفحة الرئيسية',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.moon),
      'label': 'تفعيل الوضع الليلي',
      'hasSwitch': true,
    },
    const {
      'icon': Icon(Iconsax.emoji_happy),
      'label': 'المزيد من التطبيقات',
      'hasSwitch': false,
    },
    const {
      'icon': Icon(Iconsax.share),
      'label': 'مشاركة التطبيق',
      'hasSwitch': false,
    },
  ];

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          SettingsItem(index: index, settingsList: settingsList),
      itemCount: settingsList.length,
    );
  }
}
