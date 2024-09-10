import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/views/quran_screen/cubit/change_scene_cubit.dart';
import 'package:quran_project/views/quran_screen/helpers/app_bar_customization.dart';
import 'package:quran_project/views/quran_screen/pages/quran_page.dart';
import 'package:quran_project/views/quran_screen/pages/quran_surah_page_builder.dart';
import 'package:quran_project/widgets/custom_appbar.dart';

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;

  const SurahDetailScreen({super.key, required this.surahNumber});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  bool _hasUpperContent = true;

  @override
  Widget build(BuildContext context) {
    final int totalVerses = quran.getVerseCount(widget.surahNumber);
    final int startPage = quran.getPageNumber(widget.surahNumber, 1);
    final int endPage = quran.getPageNumber(widget.surahNumber, totalVerses);

    final Map<int, List<int>> versesByPage = {};
    for (int verseNumber = 1; verseNumber <= totalVerses; verseNumber++) {
      final int pageNumber =
          quran.getPageNumber(widget.surahNumber, verseNumber);
      if (!versesByPage.containsKey(pageNumber)) {
        versesByPage[pageNumber] = [];
      }
      versesByPage[pageNumber]!.add(verseNumber);
    }

    final List<int> pages =
        List.generate(endPage - startPage + 1, (index) => startPage + index);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _hasUpperContent
            ? quranAppBarCustomization(context, surahNumber: widget.surahNumber)
            : null,
        drawer: CustomDrawer(),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _hasUpperContent = !_hasUpperContent;
            });
          },
          child: BlocBuilder<ChangeSceneCubit, ChangeSceneState>(
            builder: (context, state) {
              if (state is ChangeSceneChangedToList) {
                return const SurahListScreen();
              } else if (state is ChangeSceneChangedToQuranPage) {
                return QuranSurahPageBuilder(
                  pages: pages,
                  versesByPage: versesByPage,
                  surahNumber: widget.surahNumber,
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
