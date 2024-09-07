import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideopageController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  final String url;
  VideopageController({required this.url});

  @override
  void onInit() {
    super.onInit();
    initializedPlayer();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
  }

  Future<void> initializedPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
    );
    update();
  }
}
