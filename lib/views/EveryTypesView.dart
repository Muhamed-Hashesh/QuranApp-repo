import 'package:flutter/material.dart';
import 'package:quran/widgets/CustomAppBar.dart';

import '../themes/colors.dart';

class Everytypesview extends StatelessWidget {
  const Everytypesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(),
        drawer: const Drawer(),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2),
            ],
          ),
          child: Row(
            children: [
              // Left side content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الظهر',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8B5A4C), // Customize the color
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '11:45',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: LightColors.instance.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'الصلاة التالية: العصر',
                    style: TextStyle(
                      fontSize: 14,
                      color: LightColors.instance.kPrimaryColor,
                    ),
                  ),
                  Text(
                    '2:50 مساءً',
                    style: TextStyle(
                      fontSize: 14,
                      color: LightColors.instance.kPrimaryColor,
                    ),
                  ),
                ],
              ),

              // Right side image
              Image.asset(
                'assets/images/open_book.jpg',
                width: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
