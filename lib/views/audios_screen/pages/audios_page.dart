import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/audios_screen/widgets/audio_page_content.dart';
import 'package:quran/views/custom_drawer/CustomDrawer.dart';
import 'package:quran/widgets/CustomAppBar.dart';

class AudiosPage extends StatelessWidget {
  const AudiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: Customappbar(title: 'الصوتيات'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.separated(
            itemBuilder: (context, index) => const AudiosPageContent(),
            separatorBuilder: (context, index) => 16.height,
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
