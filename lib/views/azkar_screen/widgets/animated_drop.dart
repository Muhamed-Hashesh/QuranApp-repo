import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/azkar_screen/cubit/cubit/azkar_cubit.dart';
import 'package:quran/views/azkar_screen/widgets/reach_text_reqaa.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran/widgets/paje_container.dart';

class AzkarAnimatedDrop extends StatelessWidget {
  const AzkarAnimatedDrop({
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
          ? BlocBuilder<AzkarCubit, AzkarState>(
              builder: (context, state) {
                if (state is AzkarLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AzkarLoaded) {
                  final azkarList = state.azkar;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final azkar = azkarList[index];
                      return PajeContainer(azkarModel: azkar);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: azkarList.length,
                  );
                } else if (state is AzkarError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const SizedBox();
              },
            )
          : const SizedBox(),
    );
  }
}
