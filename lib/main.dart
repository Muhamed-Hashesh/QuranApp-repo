import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran_project/themes/theme.dart';
import 'package:quran_project/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran_project/views/on_boarding/on_boarding.dart';
import 'package:quran_project/views/quran_screen/cubit/change_scene_cubit.dart';
import 'package:quran_project/views/sebha_screen/cubit/sebha_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AllMediaCubit()),
        BlocProvider(create: (context) => ChangeSceneCubit()),
        BlocProvider(create: (context) => TasbihCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const OnBoarding(),
      ),
    );
  }
}
