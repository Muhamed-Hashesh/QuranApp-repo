import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/azkar_screen/Data/azkar_api/azkar_api.dart';
import 'package:quran_project/views/azkar_screen/Data/azkar_repo/azkar_repo.dart';
import 'package:quran_project/views/azkar_screen/cubit/cubit/azkar_cubit.dart';
import 'package:quran_project/views/azkar_screen/widgets/azkar_page_content.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/widgets/custom_appbar.dart';
import 'package:quran_project/helpers/sized_box.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الأذكار'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocProvider(
            create: (context) => AzkarCubit(AzkarRepo(azkarApi: AzkarApi())),
            child: ListView.builder(
                itemBuilder: (context, index) => const AzkarPageContent()),
          ),
        ),
      ),
    );
  }
}
