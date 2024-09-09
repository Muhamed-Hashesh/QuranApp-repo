import 'package:flutter/material.dart';
import 'package:quran/views/azkar_screen/widgets/animated_drop.dart';

class AzkarPageContent extends StatefulWidget {
  const AzkarPageContent({super.key});

  @override
  State<AzkarPageContent> createState() => _AzkarPageContentState();
}

class _AzkarPageContentState extends State<AzkarPageContent>
    with AutomaticKeepAliveClientMixin {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super to maintain the state
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'أذكار الصباح',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                AnimatedRotation(
                  turns: isPressed ? 0.25 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        AzkarAnimatedDrop(isPressed: isPressed),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
