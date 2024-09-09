import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_project/helpers/Video_getx.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/views/every_types_screen/models/all_media_model.dart';
import 'package:quran_project/widgets/custom_appbar.dart';
import '../widgets/video_play.dart';

class PlayVideoScreen extends GetView<VideopageController> {
  final Data data;
  // final PreparedBy preparedBy;
  final Attachments attachments;

  const PlayVideoScreen(
      {super.key,
      required this.data,
      // required this.preparedBy,
      required this.attachments});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'مشغل الفيديو'),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoPlayer(
                videoPath: attachments.mediaUrl ??
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title ?? 'no title',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.description ?? 'no Desc...',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   preparedBy.title ?? 'Unknown author',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //     color: Theme.of(context).colorScheme.primary,
                        //   ),
                        // ),
                        8.width,
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 20,
                          child: Icon(Icons.person, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
