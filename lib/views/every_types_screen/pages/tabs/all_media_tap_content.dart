import 'package:flutter/material.dart';

class AllMediaTapContent extends StatelessWidget {
  const AllMediaTapContent({super.key});

  static const List<Map<String, dynamic>> allMediaList = [
    {
      'title': 'المقالات',
      'subTitle': 'قم بتصفح المقالات الدينية من هنا',
      'color': Color(0xff284E46),
    },
    {
      'title': 'الصوتيات',
      'subTitle': 'استمع الي المساند والمحاضرات الصوتية من هنا',
      'color': Color(0xff323232),
    },
    {
      'title': 'الفيديوهات',
      'subTitle': 'عرض الفيديوهات الدينية من هنا',
      'color': Color(0xff783E3E),
    },
    {
      'title': 'الكتب',
      'subTitle': 'قم بتصفح الكتب الدينية  وكتب السنه',
      'color': Color(0xff625137),
    },
    {
      'title': 'الخطب',
      'subTitle': 'شاهد الخطب الدينية كلها من هنا',
      'color': Color(0xff463E78),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: allMediaList[index]['color'],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              allMediaList[index]['title'],
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            Text(
              allMediaList[index]['subTitle'],
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
      itemCount: allMediaList.length,
    );
  }
}
