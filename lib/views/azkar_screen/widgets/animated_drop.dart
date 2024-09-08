import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/azkar_screen/widgets/reach_text_reqaa.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran/widgets/paje_container.dart';

class AzkarAnimatedDrop extends StatelessWidget {
  const AzkarAnimatedDrop({
    super.key,
    required this.isPressed,
    // required this.index,
  });

  final bool isPressed;
  // final int index;

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
                  itemBuilder: (context, index) => const Column(
                    children: [PajeContainer(), ReachTextReqaa()],
                  ),
                  separatorBuilder: (context, index) => 20.height,
                  itemCount: 3,
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
