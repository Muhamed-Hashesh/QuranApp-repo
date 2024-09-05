import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isNightModeEnabled = false;

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            settingsList[index]['label'],
            maxLines: 1,
            softWrap: false,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
          trailing: settingsList[index]['hasSwitch']
              ? Switch(
                  value: isNightModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNightModeEnabled = value;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                )
              : null,
          leading: settingsList[index]['icon']),
      itemCount: settingsList.length,
    );
  }
}
