import 'package:flutter/material.dart';
import 'package:quran_project/views/al_ad3ya_screen/ad3ya_json.dart';

class AnimatedDots extends StatelessWidget {
  const AnimatedDots({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          ad3yaList.length,
          (index) => AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: pageIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            duration: const Duration(milliseconds: 300),
            width: pageIndex == index ? 18 : 7,
            height: 7,
          ),
        ),
      ),
    );
  }
}
