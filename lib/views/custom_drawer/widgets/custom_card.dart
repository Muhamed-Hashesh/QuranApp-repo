import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/helpers/sized_box.dart';

class CustomCard extends StatelessWidget {
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
          Icon(
            Iconsax.arrow_left_2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
