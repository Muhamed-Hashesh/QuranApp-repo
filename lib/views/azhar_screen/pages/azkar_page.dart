import 'package:flutter/material.dart';
import 'package:quran/helpers/inner_pages_app_bar.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/azhar_screen/widgets/azkar_page_content.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar:
            InPagesAppBar(context, scaffoldKey: _scaffoldKey, title: 'الأذكار'),
        drawer: const Drawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.separated(
              itemBuilder: (context, index) => const AzkarPageContent(),
              separatorBuilder: (context, index) => 16.height,
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
