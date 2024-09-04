import 'package:flutter/material.dart';

Text reqaaFont16Regular(
  BuildContext context, {
  required String colorProperty,
  required String text,
}) {
  Color? selectedColor;

  switch (colorProperty) {
    case 'primary':
      selectedColor = Theme.of(context).colorScheme.primary;
      break;

    case 'paje':
      selectedColor = Theme.of(context).colorScheme.onPrimary;
      break;
    case 'black':
      selectedColor = Theme.of(context).colorScheme.onSurface;
      break;
    case 'grey':
      selectedColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
      break;

    default:
      selectedColor = Theme.of(context).colorScheme.primary;
  }

  return Text(
    text,
    style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: selectedColor,
        ),
  );
}
