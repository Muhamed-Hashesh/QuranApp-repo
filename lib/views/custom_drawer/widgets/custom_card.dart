import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/quran_screen/pages/surah_details_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 4),
          ),
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: AssetImage('assets/images/drawer_header.png'),
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('القرآن الكريم',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          48.height,
          const Icon(
            Iconsax.arrow_left_2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
