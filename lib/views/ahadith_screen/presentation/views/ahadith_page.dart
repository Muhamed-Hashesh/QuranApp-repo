import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/ahadith_screen/Data/ahadith_api/hadith_api.dart';
import 'package:quran_project/views/ahadith_screen/Data/ahadith_repo/hadith_repo.dart';
import 'package:quran_project/views/ahadith_screen/cubit/cubit/hadith_cubit.dart';
import 'package:quran_project/views/ahadith_screen/presentation/widgets/ahadith_page_content.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/widgets/custom_appbar.dart';

class AhadithPage extends StatelessWidget {
  const AhadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الأحاديث'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocProvider(
            create: (context) =>
                HadithCubit(HadithRepo(hadithApi: HadithApi())),
            child: const AhadithPageContent(),
          ),
        ),
      ),
    );
  }
}
