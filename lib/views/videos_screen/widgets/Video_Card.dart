import 'package:flutter/material.dart';

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
      onTap: () {},
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(
                    imaeUrl,
                    fit: BoxFit.cover,
                    height: 176,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Almarai',
                          color: Theme.of(context).colorScheme.onSurface),
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
