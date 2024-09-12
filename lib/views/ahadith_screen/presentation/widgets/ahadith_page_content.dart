import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/ahadith_screen/cubit/cubit/hadith_cubit.dart';
import 'package:quran_project/views/ahadith_screen/presentation/widgets/hadith_animated_drop.dart';

/*
class AhadithPageContent extends StatefulWidget {
  const AhadithPageContent({super.key});

  @override
  State<AhadithPageContent> createState() => _AhadithPageContentState();
}

class _AhadithPageContentState extends State<AhadithPageContent>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, dynamic>> hadithtypes = [
    {"id": 'bukhari', "name": "أحاديث البخاري"},
    {"id": 'muslim', "name": "أحاديث مسلم"},
    {"id": 'ahmad', "name": "أحاديث أحمد"},
    {"id": 'abu-dawud', "name": "أحاديث أبو داود"},
    {"id": 'malik', "name": "أحاديث مالك"},
    {"id": 'tirmidzi', "name": "أحاديث الترمزي"},
    {"id": 'ibnu-majah', "name": "أحاديث بن ماجه"},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: hadithtypes.map((type) {
          int index = hadithtypes.indexOf(type);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = null;
                      } else {
                        expandedIndex = index;
                      }
                      if (expandedIndex != null) {
                        BlocProvider.of<HadithCubit>(context)
                            .getAhadith(type["id"]);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          type["name"],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        AnimatedRotation(
                          turns: expandedIndex == index ? 0.25 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (expandedIndex == index) const HadithAnimatedDrop(),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
*/
//-------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/ahadith_screen/cubit/cubit/hadith_cubit.dart';
import 'package:quran_project/views/ahadith_screen/presentation/widgets/hadith_animated_drop.dart';

class AhadithPageContent extends StatefulWidget {
  const AhadithPageContent({super.key});

  @override
  State<AhadithPageContent> createState() => _AhadithPageContentState();
}

class _AhadithPageContentState extends State<AhadithPageContent>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, dynamic>> hadithTypes = [
    {"id": 'bukhari', "name": "أحاديث البخاري"},
    {"id": 'muslim', "name": "أحاديث مسلم"},
    {"id": 'ahmad', "name": "أحاديث أحمد"},
    {"id": 'abu-dawud', "name": "أحاديث أبو داود"},
    {"id": 'malik', "name": "أحاديث مالك"},
    {"id": 'tirmidzi', "name": "أحاديث الترمزي"},
    {"id": 'ibnu-majah', "name": "أحاديث بن ماجه"},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(hadithTypes.length, (index) {
          final type =
              hadithTypes[index]; // Use List.generate to avoid index issues
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = null; // Collapse if already expanded
                      } else {
                        expandedIndex = index; // Expand the current dropdown
                        BlocProvider.of<HadithCubit>(context).getAhadith(
                            type["id"]); // Fetch data for the selected type
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          type["name"],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        AnimatedRotation(
                          turns: expandedIndex == index ? 0.25 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (expandedIndex == index) const HadithAnimatedDrop(),
            ],
          );
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
