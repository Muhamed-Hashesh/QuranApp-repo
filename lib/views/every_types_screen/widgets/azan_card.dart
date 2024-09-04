import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/helpers/sized_box.dart';

class AzanCard extends StatelessWidget {
  const AzanCard({
    super.key,
    required this.index,
  });
  final int index;

  static const List images = [
    'assets/icons/radix-icons_moon.svg',
    'assets/icons/mdi_sunrise.svg',
    'assets/icons/ph_sun-bold.svg',
    'assets/icons/ph_cloud-sun-bold.svg',
    'assets/icons/mingcute_sunset-line.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(images[index]),
              16.width,
              Text(
                'الظهر',
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          Text(
            '-04:55',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
