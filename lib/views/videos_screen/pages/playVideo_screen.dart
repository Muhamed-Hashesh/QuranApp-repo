import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/helpers/Video_getx.dart';
import 'package:quran/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran/views/videos_screen/widgets/content_video.dart';
import 'package:quran/widgets/custom_appbar.dart';

import '../widgets/VideoPlay.dart';

class PlayVideoScreen extends GetView<VideopageController> {
  const PlayVideoScreen({super.key});

  final String title = 'أصول الدين (الحلقة 6) آداب رب الخدمة';
  final String subtitle =
      'الخدمة الحقيقية والمستمرة هي جزء من برنامج "أصول الدين" الذي يستعرض الأساسيات والمبادئ الرئيسية للإيمان الإسلامي. في هذه الحلقة، نتناول موضوع آداب رب الخدمة وأهميتها في الحياة اليومية للمسلم.';
  final String speaker = 'سعيد بن علي بن وهف القحطاني';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الفيديوهات'),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoPlayer(),
              ContentVideo(title: title, subtitle: subtitle, speaker: speaker),
            ],
          ),
        ),
      ),
    );
  }
}
