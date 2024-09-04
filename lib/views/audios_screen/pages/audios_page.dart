import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/inner_pages_app_bar.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/audios_screen/widgets/audio_page_content.dart';
import 'package:quran/views/audios_screen/widgets/audio_player_container.dart';
import 'package:quran/views/azhar_screen/widgets/animated_drop.dart';

class AudiosPage extends StatelessWidget {
  const AudiosPage({super.key});
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: inPagesAppBar(context,
            scaffoldKey: _scaffoldKey, title: 'الصوتيات'),
        drawer: const Drawer(),
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
