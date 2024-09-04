import 'package:flutter/material.dart';
import 'package:quran/views/al_ad3ya_screen/widgets/ad3ya_page_content.dart';
import 'package:quran/views/al_ad3ya_screen/widgets/animated_dots.dart';
import 'package:quran/views/custom_drawer/CustomDrawer.dart';
import 'package:quran/widgets/CustomAppBar.dart';

class AlAd3yaScreen extends StatefulWidget {
  const AlAd3yaScreen({super.key});

  @override
  State<AlAd3yaScreen> createState() => _AlAd3yaScreenState();
}

class _AlAd3yaScreenState extends State<AlAd3yaScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(title: 'الأدعية'),
        drawer: CustomDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => const Ad3yaPagesContent(),
                itemCount: 20,
              ),
            ),
            AnimatedDots(pageIndex: pageIndex),
          ],
        ),
      ),
    );
  }
}
