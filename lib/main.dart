import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran/themes/theme.dart';
import 'package:quran/views/al_ad3ya_screen/pages/ad3ya_page.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran/views/every_types_screen/services/all_media_services.dart';
import 'package:quran/views/on_boarding/on_boarding.dart';
import 'package:quran/views/videos_screen/pages/videoListview_screen.dart';

void main() {
  runApp(const MyApp());
  // AllMediaServices().getAllMedia(media: 'audios');
  AllMediaCubit().getData(media: 'audios');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllMediaCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const OnBoarding(),
        // home: const AlAd3yaScreen(),
        // home: const VideolistviewScreen(),
      ),
    );
  }
}
