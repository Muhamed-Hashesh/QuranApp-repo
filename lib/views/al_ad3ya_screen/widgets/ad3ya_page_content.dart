import 'package:flutter/material.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/views/al_ad3ya_screen/ad3ya_json.dart';
import 'package:quran_project/widgets/paje_container.dart';

class Ad3yaPagesContent extends StatelessWidget {
  const Ad3yaPagesContent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ad3yaList[index]['title'],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${convertToArabicNumerals(ad3yaList[index]['content'].length.toString())} أدعية',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: ad3yaList[index]['content'].length,
              itemBuilder: (context, i) {
                return PajeContainer(text: ad3yaList[index]['content'][i]);
              },
              separatorBuilder: (BuildContext context, int index) => 20.height,
            ),
          ),
        ],
      ),
    );
  }
}
