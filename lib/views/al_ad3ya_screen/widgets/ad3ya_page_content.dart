import 'package:flutter/material.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/widgets/paje_container.dart';

class Ad3yaPagesContent extends StatelessWidget {
  const Ad3yaPagesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'أدعية الرحمة',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '٣ أدعية',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PajeContainer();
            },
            separatorBuilder: (BuildContext context, int index) => 20.height,
          ),
        ),
      ],
    );
  }
}
