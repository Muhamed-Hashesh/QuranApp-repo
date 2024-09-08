import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/themes/theme.dart';
import 'package:quran/views/al_ad3ya_screen/pages/ad3ya_page.dart';
import 'package:quran/views/every_types_screen/services/all_media_services.dart';
import 'package:quran/views/on_boarding/on_boarding.dart';
import 'package:quran/views/videos_screen/pages/videoListview_screen.dart';

void main() {
  runApp(const MyApp());
  AllMediaServices().getAllMedia(media: 'audios');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const OnBoarding(),
      // home: const AlAd3yaScreen(),
      // home: const VideolistviewScreen(),
    );
  }
}
