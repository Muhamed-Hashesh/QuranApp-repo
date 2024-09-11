import 'package:flutter/material.dart';
import 'package:quran_project/views/every_types_screen/pages/every_types_view.dart';

class OutlinedButtonStart extends StatelessWidget {
  const OutlinedButtonStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const EveryTypesView(),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'ابدأ الآن',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
