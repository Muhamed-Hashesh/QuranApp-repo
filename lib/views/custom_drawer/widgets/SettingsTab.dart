import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        ListTile(
          title: const Text('التفسير'),
          leading: const Icon(Icons.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الأجزاء'),
          leading: const Icon(Icons.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الأحزاب'),
          leading: const Icon(Icons.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text('المسجدات'),
          leading: const Icon(Icons.book),
          onTap: () {},
        ),
        ListTile(
          title: const Text('الركوع'),
          leading: const Icon(Icons.book),
          onTap: () {},
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
