import 'package:flutter/material.dart';

class PajeContainer extends StatelessWidget {
  const PajeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'اللهمَّ مالِكَ المُلْكِ تُؤْتي المُلْكَ مَن تشاءُ وتنزِعُ المُلْكَ ممَّن تشاءُ وتُعِزُّ مَن تشاءُ وتُذِلُّ مَن تشاءُ بيدِك الخيرُ إنَّك على كلِّ شيءٍ قديرٌ، رحمنَ الدُّنيا والآخرةِ تُعْطيهما مَن تشاءُ وتمنَعُ منهما مَن تشاءُ ارحَمْني رحمةً تُغْنيني بها عن رحمةِ مَن سِواك',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
