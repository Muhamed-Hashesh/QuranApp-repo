import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/helpers/sized_box.dart';

class AudioPlayerContainer extends StatefulWidget {
  const AudioPlayerContainer({super.key});

  @override
  _AudioPlayerContainerState createState() => _AudioPlayerContainerState();
}

class _AudioPlayerContainerState extends State<AudioPlayerContainer> {
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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
                  'مسند أبي بكر الصديق - رضي الله عنه',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentPosition.toDouble(),
                        min: 0.0,
                        max: _duration.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _currentPosition = value.toInt();
                          });
                          _audioPlayer.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    Text(
                      _formatTime(remainingTime),
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
