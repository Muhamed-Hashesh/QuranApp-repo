import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/every_types_screen/models/all_media_model.dart';
import 'package:quran_project/views/videos_screen/pages/play_video_screen.dart';

class CardVideosListView extends StatelessWidget {
  const CardVideosListView({
    super.key,
    required this.data,
    // required this.preparedBy,
    required this.attachments,
  });

  final Data data;
  // final PreparedBy preparedBy;
  final Attachments attachments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PlayVideoScreen(
        data: data,
        // preparedBy: preparedBy,
        attachments: attachments,
      )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(
                data.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBQaH0iL3i2SDCvG3iUUbh6BrYFagdbZ1varZBiLzx34AzdukVCcI-cA4HgZXC7wuD7is&usqp=CAU',
                fit: BoxFit.cover,
                height: 176,
                width: double.infinity,
              ),
            ),
            10.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
                8.height,
                Text(
                  data.description ?? '',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                  textDirection: TextDirection.rtl,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
