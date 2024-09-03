import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/inner_pages_app_bar.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/widgets/paje_container.dart';

class AzkarPage extends StatefulWidget {
  const AzkarPage({super.key});

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar:
            InPagesAppBar(context, scaffoldKey: _scaffoldKey, title: 'الأذكار'),
        drawer: const Drawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'أذكار الصباح',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        AnimatedRotation(
                          turns: isPressed
                              ? 0.25
                              : 0.0, // Rotate 180 degrees when pressed
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            IconsaxPlusBold.arrow_down,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.height,
                AnimatedSize(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  reverseDuration: const Duration(milliseconds: 600),
                  child: isPressed
                      ? Container(
                          constraints: const BoxConstraints(
                            minHeight: 100,
                            maxHeight: 500,
                          ),
                          child: ListView.separated(
                            shrinkWrap:
                                true, // Ensures the ListView takes only needed space
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                const PajeContainer(),
                            separatorBuilder: (context, index) => 20.height,
                            itemCount: 3,
                          ),
                        )
                      : const SizedBox(), // Collapse to nothing when not pressed
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
