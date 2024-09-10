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

class QuranSurahPageBuilder extends StatelessWidget {
  const QuranSurahPageBuilder({
    super.key,
    required this.pages,
    required this.versesByPage,
    required this.surahNumber,
  });

  final List<int> pages;
  final Map<int, List<int>> versesByPage;
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final pageNumber = pages[index];
        final verses = versesByPage[pageNumber] ?? [];
        final isFirstPage = index == 0;

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                24.height,
                if (isFirstPage)
                  Column(
                    children: [
                      ChapterHeader(surahNumber: surahNumber),
                      24.height,
                      surahNumber != 9 && surahNumber != 1
                          ? const Image(
                              image: AssetImage('assets/images/basmala.png'),
                              width: 250,
                            )
                          : const SizedBox(),
                    ],
                  ),
                // if (surahNumber != 9) ChapterHeader(surahNumber: surahNumber),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontSize: 23,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    children: [
                      ...verses.map((verseNumber) {
                        final verseText =
                            quran.getVerse(surahNumber, verseNumber);
                        final verseNumberArabic =
                            convertToArabicNumerals(verseNumber.toString());
                        return TextSpan(
                          text: '$verseText $verseNumberArabic ',
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChapterHeader extends StatelessWidget {
  const ChapterHeader({
    super.key,
    required this.surahNumber,
  });

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/sharing_chapter_header.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Center(
        child: Text(
          'سورة ${quran.getSurahNameArabic(surahNumber)}',
          style: TextStyle(
            fontFamily: 'UthmanicHafs',
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
