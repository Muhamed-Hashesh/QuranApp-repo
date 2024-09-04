import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/every_types_screen/widgets/azan_card.dart';

class PrayingTimeTapContent extends StatelessWidget {
  const PrayingTimeTapContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _customListTile(context,
                title: 'الثلاثاء ١٢ ديسمبر ٢٠٢٤',
                subTitle: 'الأحد ربيع الأول ١٤٤٥',
                icon: IconsaxPlusBold.calendar_2),
            _customListTile(context,
                title: 'المكان',
                subTitle: 'القاهرة - مصر',
                icon: IconsaxPlusBold.location),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/vuesax/bulk/clock.svg'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customListTile(context,
                      title: 'الوقت المتبقي',
                      subTitle: ' لصلاة الظهر',
                      icon: null,
                      hasIcon: false),
                  16.width,
                  Text(
                    '-04:55',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(
            5,
            (index) => AzanCard(
              index: index,
            ),
          ),
        )
      ],
    );
  }

  Row _customListTile(BuildContext context,
      {required String title,
      required String subTitle,
      required IconData? icon,
      bool hasIcon = true}) {
    return Row(
      children: [
        hasIcon
            ? Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary)
            : const SizedBox(),
        hasIcon ? 8.width : 0.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 12),
            ),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        )
      ],
    );
  }
}
