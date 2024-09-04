import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  bool isNightModeEnabled = false;

  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        ListTile(
          title: const Text('التفسير'),
          leading: const Icon(Iconsax.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الأجزاء'),
          leading: const Icon(Iconsax.book1),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الأحزاب'),
          leading: const Icon(Iconsax.book4),
          onTap: () {},
        ),
        ListTile(
          title: const Text('السجدات'),
          leading: const Icon(Icons.book_outlined),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الركوع'),
          leading: const Icon(Icons.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            'تفعيل الوضع الليلي',
            maxLines: 1,
            softWrap: false,
          ),
          trailing: Switch(
            value: isNightModeEnabled,
            onChanged: (value) {
              setState(() {
                isNightModeEnabled = value;
              });
            },
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          leading: const Icon(
            Icons.nightlight_round,
          ),
        ),
        ListTile(
          title: const Text('الصفحة الرئيسية'),
          leading: const Icon(Icons.home),
          onTap: () {},
        ),
        ListTile(
          title: const Text('المزيد من التطبيقات'),
          leading: const Icon(Icons.apps),
          onTap: () {},
        ),
        ListTile(
          title: const Text('مشاركة التطبيق'),
          leading: const Icon(Icons.share),
          onTap: () {},
        ),
      ],
    );
  }
}
