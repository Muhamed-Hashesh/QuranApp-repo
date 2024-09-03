import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/widgets/paje_container.dart';

class AnimatedDrop extends StatelessWidget {
  const AnimatedDrop({
    super.key,
    required this.isPressed,
  });

  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      reverseDuration: const Duration(milliseconds: 600),
      child: isPressed
          ? Column(
              children: [
                8.height,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const PajeContainer(),
                  separatorBuilder: (context, index) => 20.height,
                  itemCount: 3,
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}