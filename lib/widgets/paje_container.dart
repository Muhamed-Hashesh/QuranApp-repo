import 'package:flutter/material.dart';
import 'package:quran/views/azkar_screen/Data/models/azkar_model.dart';

class PajeContainer extends StatelessWidget {
  final AzkarModel? azkarModel;

  const PajeContainer({
    super.key,
    this.azkarModel,
  });

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
        azkarModel?.aRABICTEXT ?? 'No text available',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
