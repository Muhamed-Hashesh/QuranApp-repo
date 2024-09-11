import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/audios_screen/widgets/audio_player_container.dart';
import 'package:quran_project/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran_project/views/every_types_screen/cubit/all_media_cubit/all_media_state.dart';

class AudiosAnimatedDrop extends StatelessWidget {
  const AudiosAnimatedDrop({
    super.key,
    required this.isPressed,
    required this.dataIndex,
    required this.count,
    // required this.index,
  });
  final int dataIndex;
  final int count;

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
                BlocBuilder<AllMediaCubit, AllMediaState>(
                  builder: (context, state) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AudioPlayerContainer(
                              attachments: context
                                  .read<AllMediaCubit>()
                                  .allMediaModel
                                  .data![dataIndex]
                                  .attachments![index],
                            ),
                        separatorBuilder: (context, index) => 20.height,
                        itemCount: count);
                  },
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
