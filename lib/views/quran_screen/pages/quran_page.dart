import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/views/quran_screen/cubit/change_scene_cubit.dart';
import 'package:quran_project/views/quran_screen/helpers/app_bar_customization.dart';

class SurahListScreen extends StatelessWidget {
  const SurahListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: quranAppBarCustomization(context),
        body: ListView.separated(
          itemCount: quran.totalSurahCount,
          itemBuilder: (context, index) {
            final surahNumber = index + 1;
            return Material(
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      convertToArabicNumerals(surahNumber.toString()),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                title: Text(
                  quran.getSurahNameArabic(surahNumber),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                subtitle: Text(
                  'آياتها ${convertToArabicNumerals(quran.getVerseCount(surahNumber).toString())} - ${quran.getPlaceOfRevelation(surahNumber) == 'Madinah' ? 'مدنية' : 'مكية'}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                trailing: Text(
                  'الصفحة ${convertToArabicNumerals(quran.getPageNumber(surahNumber, 1).toString())}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () => context
                    .read<ChangeSceneCubit>()
                    .changeSceneToPage(surahNumber: surahNumber),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => 16.height,
        ),
      ),
    );
  }
}
