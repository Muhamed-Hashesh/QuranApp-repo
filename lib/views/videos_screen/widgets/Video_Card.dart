import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';

import '../pages/playVideo_screen.dart';

class Card_Videos_Listview extends StatelessWidget {
  const Card_Videos_Listview({
    super.key,
    required this.imaeUrl,
    required this.title,
    required this.subTitle,
  });
  final String imaeUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlayVideoScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                imaeUrl,
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
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
                8.height,
                Text(
                  subTitle,
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
