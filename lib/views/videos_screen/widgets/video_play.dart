import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/helpers/Video_getx.dart';
import 'package:quran/views/every_types_screen/models/all_media_model.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key, required this.videoPath});

  final String videoPath;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideopageController>(
      init: VideopageController(url: videoPath),
      builder: (controller) {
        return Container(
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: controller.chewieController != null &&
                    controller.chewieController!.videoPlayerController.value
                        .isInitialized
                ? Chewie(controller: controller.chewieController!)
                : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
