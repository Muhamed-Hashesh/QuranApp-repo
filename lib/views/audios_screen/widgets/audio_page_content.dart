import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/audios_screen/widgets/audio_animated_drop.dart';
import 'package:quran_project/views/every_types_screen/models/all_media_model.dart';

class AudiosPageContent extends StatefulWidget {
  const AudiosPageContent({
    super.key,
    required this.data,
    required this.dataIndex,
    required this.count,
  });

  final Data data;
  final int dataIndex;
  final int count;

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
                        widget.data.title ?? 'no title here',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      6.height,
                      Text(
                        widget.data.description ?? 'no Description here',
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
        AudiosAnimatedDrop(
          isPressed: isPressed,
          dataIndex: widget.dataIndex,
          count: widget.count,
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
