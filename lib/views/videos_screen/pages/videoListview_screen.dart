import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';
import 'package:quran/views/custom_drawer/pages/custom_drawer.dart';

import '../widgets/Video_Card.dart';

class VideolistviewScreen extends StatelessWidget {
  const VideolistviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(title: 'الفيديوهات'),
        drawer: CustomDrawer(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Card_Videos_Listview(
              imaeUrl: 'assets/images/quran_book.png',
              title: 'أصول التحليل الفني ل سوق الأسهم',
              subTitle:
                  'التحليل الفني و الأساسي من مواضيع "البرصة" التي يهتم بها المستثمرون في الأسواق المالية , لما لها من أهمية في تحديد أوقات الدخول و الخروج من السوق',
            );
          },
        ),
      ),
    );
  }
}
