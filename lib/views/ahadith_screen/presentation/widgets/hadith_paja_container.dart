import 'package:flutter/material.dart';
import 'package:quran_project/views/ahadith_screen/Data/models/hadith_model.dart';

class PajeContainer extends StatelessWidget {
  final HadithModel? ahadithModel;
  final String text;

  const PajeContainer(
      {super.key, this.ahadithModel, this.text = 'No Text Here'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        ahadithModel?.arab ?? text,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
