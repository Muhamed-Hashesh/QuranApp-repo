import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/themes/colors.dart';

import '../widgets/CustomOutlinedButton.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3E8D5),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Image.asset(
                    "assets/images/basmala.png",
                  ),
                ),
                Image.asset("assets/images/quran_book.png"),
                Text(
                  'تطبيق العبادات',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                16.height,
                Text(
                  '''تعلم الدين الاسلامي عن طريق تصنيفات وملفات وشروحات ومحاضرات ٫٫الخ , يوفر أوقات الصلاة وخطب والقرآن الكريم كامل مع توفير تفسير وقراءة بالصوت ٫٫ اكتشف المزيد بنفسك''',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color:
                            LightColors.instance.kBlackColor.withOpacity(0.5),
                      ),
                ),
                const SizedBox(height: 20),
                const OutlinedButtonStart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
