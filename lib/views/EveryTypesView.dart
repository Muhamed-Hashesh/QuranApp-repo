import 'package:flutter/material.dart';
import 'package:quran/widgets/CustomAppBar.dart';

class Everytypesview extends StatelessWidget {
  const Everytypesview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: Customappbar(),
        drawer: Drawer(),
      ),
    );
  }
}
