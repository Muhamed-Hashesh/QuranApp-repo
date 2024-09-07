import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/helpers/Video_getx.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideopageController>(
      init: VideopageController(
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
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
