import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constants/constants.dart';
import 'package:quran/views/audios_screen/pages/audios_page.dart';
import 'package:quran/views/books_screen/pages/books_page.dart';
import 'package:quran/views/videos_screen/pages/videoListview_screen.dart';

class AllMediaTapContent extends StatelessWidget {
  const AllMediaTapContent({super.key});

  static const List<Map<String, dynamic>> allMediaList = [
    {
      'path': AppConstants.articlesPath,
      'title': 'المقالات',
      'subTitle': 'قم بتصفح المقالات الدينية من هنا',
      'color': Color(0xff284E46),
      'router': BooksPage(),
    },
    {
      'path': AppConstants.audiosPath,
      'title': 'الصوتيات',
      'subTitle': 'استمع الي المساند والمحاضرات الصوتية من هنا',
      'color': Color(0xff323232),
      'router': AudiosPage(),
    },
    {
      'path': AppConstants.videosPath,
      'title': 'الفيديوهات',
      'subTitle': 'عرض الفيديوهات الدينية من هنا',
      'color': Color(0xff783E3E),
      'router': VideolistviewScreen(),
    },
    {
      'path': AppConstants.booksPath,
      'title': 'الكتب',
      'subTitle': 'قم بتصفح الكتب الدينية  وكتب السنه',
      'color': Color(0xff625137),
      'router': BooksPage(),
    },
    {
      'path': AppConstants.khotabPath,
      'title': 'الخطب',
      'subTitle': 'شاهد الخطب الدينية كلها من هنا',
      'color': Color(0xff463E78),
      'router': VideolistviewScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          AllMediaCardItem(allMediaList: allMediaList, index: index),
      itemCount: allMediaList.length,
    );
  }
}

class AllMediaCardItem extends StatelessWidget {
  const AllMediaCardItem({
    super.key,
    required this.allMediaList,
    required this.index,
  });

  final List<Map<String, dynamic>> allMediaList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(allMediaList[index]['router']),
      child: Container(
        padding: const EdgeInsets.all(16),
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
    );
  }
}
