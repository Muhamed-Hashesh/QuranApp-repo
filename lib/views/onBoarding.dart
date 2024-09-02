import 'package:flutter/material.dart';

import '../widgets/CustomOutlinedButton.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Image.asset("assets/images/basmala.png"),
          ),
          Image.asset("assets/images/quran_book.png"),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 10.0),
                child: Text(
                  'تطبيق العبادات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '''تعلم الدين الاسلامي عن طريق تصنيفات وملفات وشروحات ومحاضرات ٫٫الخ , يوفر أوقات الصلاة وخطب والقرآن الكريم كامل مع توفير تفسير وقراءة بالصوت ٫٫ اكتشف المزيد بنفسك''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 22,
                color: Color.fromARGB(240, 0, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const OutlinedButton_Start(),
        ],
      ),
    );
  }
}
