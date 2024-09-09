import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/themes/colors.dart';
import 'package:quran_project/views/every_types_screen/widgets/today_verse_card_audio.dart';

class TodayVerseCardPageViewContent extends StatelessWidget {
  const TodayVerseCardPageViewContent({
    super.key,
    this.index = 0,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: LightColors.instance.kAyahTodayCardColor,
        borderRadius: BorderRadius.circular(15.0),
        border: const Border(
          left: BorderSide(
            color: Color(0xffFFB57D),
            width: 5.0,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: LightColors.instance.kAyahTodayFontColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconsaxPlusBold.heart_add,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.5),
                    size: 28,
                  ))
            ],
          ),
          index == 0
              ? const Content1()
              : index == 1
                  ? const Content2()
                  : const TodayVerseCardAudio(),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'سورة الفاتحة - الجزء الثلاثون  - آية ١',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: LightColors.instance.kAyahTodayFontColor,
                    fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Content2 extends StatelessWidget {
  const Content2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'الثناء الكامل، وجميع أنواع المحامد من صفات الجلال والكمال هي لله وحده دون من سواه؛ إذ هو رب كل شيء وخالقه ومدبره.والعالمون جمع عالَم، وهم كل ما سوى الله تعالى.',
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class Content1 extends StatelessWidget {
  const Content1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.ltr,
      'All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.All praise and thanks be to the Lord of the worlds.',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
