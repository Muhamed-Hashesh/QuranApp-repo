import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/azhar_screen/widgets/azkar_page_content.dart';
import 'package:quran/views/custom_drawer/CustomDrawer.dart';
import 'package:quran/widgets/CustomAppBar.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(title: 'الأذكار'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.separated(
            itemBuilder: (context, index) => const AzkarPageContent(),
            separatorBuilder: (context, index) => 16.height,
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
