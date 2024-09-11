import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran_project/views/azkar_screen/widgets/animated_drop.dart';
import 'package:quran_project/views/azkar_screen/widgets/reach_text_reqaa.dart';
import 'package:quran_project/widgets/paje_container.dart';


class AzkarPageContent extends StatefulWidget {
  const AzkarPageContent({super.key});

  @override
  State<AzkarPageContent> createState() => _AzkarPageContentState();
}

class _AzkarPageContentState extends State<AzkarPageContent>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, dynamic>> azkartypes = [
    {"name": "أذكار الصباح والمساء", "id": 27},
    {"name": "أذكار النوم", "id": 28},
    {"name": "أذكار الاستيقاظ من النوم", "id": 1},
    {"name": "الذكر قبل الوضوء", "id": 8},
    {"name": "الذكر بعد الفراغ من الوضوء", "id": 9},
    {"name": "الذكر عند الخروج من المنزل", "id": 10},
    {"name": "الذكر عند دخول المنزل", "id": 11},
    {"name": "الأذكار بعد السلام من الصلاة", "id": 25},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: azkartypes.map((type) {
          int index = azkartypes.indexOf(type);
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
                        BlocProvider.of<AzkarCubit>(context)
                            .getAzkar(type["id"], type["name"]);
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
              if (expandedIndex == index) AzkarAnimatedDrop(typeId: type["id"]),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
