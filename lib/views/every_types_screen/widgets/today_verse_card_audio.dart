import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/themes/colors.dart';

class TodayVerseCardAudio extends StatefulWidget {
  const TodayVerseCardAudio({super.key});

  @override
  TodayVerseCardAudioState createState() => TodayVerseCardAudioState();
}

class TodayVerseCardAudioState extends State<TodayVerseCardAudio> {
  late AudioPlayer _audioPlayer;
  int _currentPosition = 0;
  int _duration = 1;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer.setUrl(
          'https://d1.islamhouse.com/data/ar/ih_sounds/chain_02/shar7-mosnd-manask-osaime/ar-01-shar7-mosnd-manask-osaime.mp3');
      _duration = _audioPlayer.duration?.inSeconds ?? 1;

      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position.inSeconds;
        });
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    int remainingTime = _duration - _currentPosition;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: LightColors.instance.kAyahTodayAudioColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: IconButton(
              icon: Icon(
                _audioPlayer.playerState.playing
                    ? IconsaxPlusBold.pause
                    : IconsaxPlusBold.arrow_right_3,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              onPressed: () {
                if (_audioPlayer.playerState.playing) {
                  _audioPlayer.pause();
                } else {
                  _audioPlayer.play();
                }
              },
            ),
          ),
          6.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'قم بتشغيل الاية',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                8.height,
                Text(
                  'القارئ الشيخ مشاري راشد العفاسي',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          8.width,
          Image.asset('assets/images/alafasy.png'),
        ],
      ),
    );
  }
}
