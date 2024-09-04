import 'dart:async';

import 'package:flutter/material.dart';
import 'time_next_pray.dart';

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<PrayerTimeCard> createState() => _PrayerTimeCardState();
}

class _PrayerTimeCardState extends State<PrayerTimeCard> {
  int imageIndex = 0;
  List<String> imagesList = [
    'assets/images/homecard1.png',
    'assets/images/homecard2.png',
    'assets/images/homecard3.png'
  ];
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        imageIndex = imageIndex == 2 ? 0 : imageIndex + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: Image.asset(imagesList[imageIndex]).image,
              fit: BoxFit.fill)),
      child: const TimeNextpray(),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // إيقاف المؤقت عند التخلص من الـ Widget
    super.dispose();
  }
}
