import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/audios_screen/widgets/audio_player_container.dart';
import 'package:quran/views/azhar_screen/widgets/animated_drop.dart';

class AudiosPageContent extends StatefulWidget {
  const AudiosPageContent({super.key});

  @override
  State<AudiosPageContent> createState() => _AudiosPageContentState();
}

class _AudiosPageContentState extends State<AudiosPageContent>
    with AutomaticKeepAliveClientMixin {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(18),
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'شرح مسند المناسك',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      6.height,
                      Text(
                        'سلسلة محاضرات صوتية، وفيها شرح الشيخ صالح العصيمي - أثابه الله - لكتابه مسند المناسك، وهو جزء فيه أصول أحاديث الحج.',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                                fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                8.width,
                AnimatedRotation(
                  turns: isPressed ? 0.25 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    IconsaxPlusBold.arrow_down,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedDrop(
          isPressed: isPressed,
          builderChild: const AudioPlayerContainer(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
