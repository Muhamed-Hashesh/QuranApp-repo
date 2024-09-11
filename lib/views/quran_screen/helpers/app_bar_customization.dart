import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/quran_screen/cubit/change_scene_cubit.dart';
import 'package:quran_project/widgets/custom_appbar.dart';
import 'package:quran/quran.dart' as quran;

CustomAppBar quranAppBarCustomization(BuildContext context,
    {int? surahNumber}) {
  return CustomAppBar(
    searchBar: true,
    notTitle: true,
    widget: InkWell(
      onTap: () => context.read<ChangeSceneCubit>().changeSceneToList(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            IconsaxPlusLinear.arrow_down,
            size: 16,
            color: Colors.grey,
          ),
          6.width,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سورة ${quran.getSurahNameArabic(surahNumber ?? 1)}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'الجزء الأول - ٤/١ الحزب ٢',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
